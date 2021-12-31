# frozen_string_literal: true

require "json"
require "net/http"
require_relative "fake_async"

module PokeClient
  class Error < StandardError; end

  class Client
    BASE_PATH = "https://pokeapi.co/api/v2/"
    PER_PAGE = 50

    def initialize
      @pokemons = []
    end

    def all_pokemons
      path = "pokemon/"
      api_response = request_pokemons(path)
      total_number_of_pokemon = api_response["count"]
      total_pages = total_number_of_pokemon / PER_PAGE
      pokemons.concat sanitize_api_response(api_response)
      Async.new.map(1..total_pages) do |page|
        offset = page * PER_PAGE
        api_response = request_pokemons(path, offset)
        pokemons.concat sanitize_api_response(api_response)
      end
      pokemons
    end

    def pokemons_by_type(type_id)
      uri = create_uri("type/#{type_id}")
      req = Net::HTTP.get(uri)
      api_response = parse_json(req)
      append_response_of_types(api_response)
      pokemons
    end

    private

    attr_reader :pokemons

    def request_pokemons(path, offset = 0)
      uri = create_uri(path, query: { offset: offset, limit: PER_PAGE })
      request = Net::HTTP.get(uri)
      parse_json(request)
    end

    def append_response_of_types(body)
      # To get aech pokemon data it's necesary to dig in body like:
      # body.pokemon.pokemon ==> {pokemon-data}
      body["pokemon"].each do |row|
        pokemons << build_pokemon_data(row["pokemon"])
      end
    end

    def sanitize_api_response(body)
      # To get aech pokemon data it's necesary to dig in body like:
      # body.results ==> {pokemon-data}
      example = []
      body["results"].each do |row|
        example << build_pokemon_data(row)
      end
      example
    end

    def parse_json(request)
      JSON.parse(request)
    rescue JSON::ParserError
      nil
    end

    def create_uri(path, **args)
      uri = URI.join(BASE_PATH, path)
      uri.query = URI.encode_www_form args.fetch(:query, {}).compact
      uri
    end

    def build_pokemon_data(pokemon_row)
      # The last number in the url it's equal to pokemon's id
      # https://pokeapi.co/api/v2/pokemon/1/
      pokemon_id = pokemon_row["url"].split("/").last
      { id: pokemon_id, name: pokemon_row["name"] }
    end
  end
end
