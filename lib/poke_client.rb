# frozen_string_literal: true

require "json"
require_relative "poke_client/version"
require_relative "poke_client/client"
require "net/http"

module PokeClient
  class Error < StandardError; end

  def self.all
    PokeClient::Client.new.all("pokemon/")
  end

  def self.normal
    PokeClient::Client.new.get_type("1")
  end

  def self.fighting
    PokeClient::Client.new.get_type("2")
  end

  def self.flying
    PokeClient::Client.new.get_type("3")
  end

  def self.ground
    PokeClient::Client.new.get_type("5")
  end

  def self.rock
    PokeClient::Client.new.get_type("6")
  end

  def self.fire
    PokeClient::Client.new.get_type("10")
  end

  def self.water
    PokeClient::Client.new.get_type("11")
  end
end
