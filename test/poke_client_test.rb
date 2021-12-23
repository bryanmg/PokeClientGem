# frozen_string_literal: true

require_relative "test_helper"

class PokeClientTest < Minitest::Test
  def test_taht_it_has_version_number
    refute_nil ::PokeClient::VERSION
  end

  def test_fetc_all_pokemons
    VCR.use_cassette("all_pokemons") do
      pokemons = PokeClient.all
      assert_instance_of Array, pokemons
      assert_instance_of Hash, pokemons.first
    end
  end

  def test_fetch_all_normal_pokemons
    VCR.use_cassette("normal") do
      pokemons = PokeClient.normal
      assert_instance_of Array, pokemons
      assert_instance_of Hash, pokemons.first
    end
  end

  def test_fetch_all_rock_pokemons
    VCR.use_cassette("rock") do
      pokemons = PokeClient.rock
      assert_instance_of Array, pokemons
      assert_instance_of Hash, pokemons.first
    end
  end

  def test_fetch_all_fighting_pokemons
    VCR.use_cassette("fighting") do
      pokemons = PokeClient.fighting
      assert_instance_of Array, pokemons
      assert_instance_of Hash, pokemons.first
    end
  end

  def test_fetch_all_flying_pokemons
    VCR.use_cassette("flying") do
      pokemons = PokeClient.flying
      assert_instance_of Array, pokemons
      assert_instance_of Hash, pokemons.first
    end
  end

  def test_fetch_all_ground_pokemons
    VCR.use_cassette("ground") do
      pokemons = PokeClient.ground
      assert_instance_of Array, pokemons
      assert_instance_of Hash, pokemons.first
    end
  end

  def test_fetch_all_fire_pokemons
    VCR.use_cassette("fire") do
      pokemons = PokeClient.fire
      assert_instance_of Array, pokemons
      assert_instance_of Hash, pokemons.first
    end
  end

  def test_fetch_all_water_pokemons
    VCR.use_cassette("water") do
      pokemons = PokeClient.water
      assert_instance_of Array, pokemons
      assert_instance_of Hash, pokemons.first
    end
  end
end
