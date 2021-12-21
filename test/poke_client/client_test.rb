# frozen_string_literal: true

module PokeClient
    class ClientTest < Minitest::Test
        def test_client_class_must_exist
            refute_nil PokeClientAPI.new
        end

        def test_it_has_base_path_initialized
            refute_nil PokeClientAPI.new.base_path
        end

        # def test_client_must_get_all_pokemons
        # end
    end
end
