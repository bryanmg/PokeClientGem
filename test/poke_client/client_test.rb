# frozen_string_literal: true

require_relative "../test_helper"

module PokeClient
  class ClientTest < Minitest::Test
    def test_client_class_must_exist
      refute_nil PokeClient::Client.new
    end

    def test_it_has_base_path_initialized
      assert_raises NoMethodError do
        PokeClient::Client.new.base_path
      end
    end

    def test_client_must_get_all_pokemons
      VCR.use_cassette("all_pokemons") do
        pokemons = PokeClient::Client.new.all_pokemons
        assert_instance_of Array, pokemons
        assert_instance_of Hash, pokemons.first
      end
    end

    def test_client_must_get_type_pokemon
      VCR.use_cassette("get_type") do
        pokemons = PokeClient::Client.new.pokemons_by_type("1")
        assert_instance_of Array, pokemons
        assert_instance_of Hash, pokemons.first
      end
    end
  end
end
