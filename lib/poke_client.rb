# frozen_string_literal: true

require "json"
require_relative "poke_client/version"
require_relative "poke_client/client"
require "net/http"

module PokeClient
  class Error < StandardError; end
  # def get(url, options={})
  #   uri = uri_path(url)
  #   if options[:query_params].is_present?
  #     uri.query = URI.encode_www_form(options[:query_params])
  #   end
  #   return Net::HTTP.get(uri)
  # end

  def self.all
    PokeClient::Client.new.all("pokemon")
  end

  def self.normal
    PokeClient::Client.new.all("type/1")
  end

  def self.fighting
    PokeClient::Client.new.all("type/2")
  end

  def self.flying
    PokeClient::Client.new.all("type/3")
  end

  def self.ground
    PokeClient::Client.new.all("type/5")
  end

  def self.rock
    PokeClient::Client.new.all("type/6")
  end

  def self.fire
    PokeClient::Client.new.all("type/10")
  end

  def self.water
    PokeClient::Client.new.all("type/11")
  end
end

