# frozen_string_literal: true

require "json"
require "net/http"
require_relative "fake_async"

module PokeClient
  class Error < StandardError; end

  class Client
    def initialize
      @base_path = "https://pokeapi.co/api/v2/"
      @per_page = 50
      @response = []
    end

    def all(path)
      all_pokemons = do_paginated_request path
      total_pages = all_pokemons / per_page
      Async.new.map(1..total_pages) do |page|
        do_paginated_request(path, page * per_page)
      end
      response
    end

    def get_type(type_id)
      req = Net::HTTP.get uri_path("type/#{type_id}")
      append_response_of_type parse_json(req)
      response
    end

    private

    attr_reader :base_path, :per_page, :response

    def do_paginated_request(path, page = 0)
      uri = uri_path(path, query: { offset: page, limit: per_page })
      request = parse_json(Net::HTTP.get(uri))
      append_response request
      request["count"].to_i
    end

    def append_response_of_type(body)
      body["pokemon"]&.each do |x|
        response << row_of_response(x["pokemon"])
      end
    end

    def append_response(body)
      body["results"]&.each do |x|
        response << row_of_response(x)
      end
    end

    def parse_json(request)
      JSON.parse(request)
    rescue JSON::ParserError
      nil
    end

    def uri_path(path, **args)
      uri = URI.join(base_path, path)
      uri.query = URI.encode_www_form args.fetch(:query, {}).compact
      uri
    end

    def row_of_response(field)
      { id: field["url"].split("/")[-1], name: field["name"] }
    end
  end
end
