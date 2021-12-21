# frozen_string_literal: true

# require "test_helper"
$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "poke_client"
require "minitest/autorun"
# require "vcr"

class PokeClientTest < Minitest::Test
  def test_taht_it_has_version_number
    refute_nil ::PokeClient::VERSION
  end

  def test_fetc_all_pokemons
    pokemons = PokeClient.all
    assert_instance_of Array, pokemons
    assert_instance_of Hash, pokemons.first
  end

  def test_fetch_all_normal_pokemons
    pokemons = PokeClient.normal
    assert_instance_of Array, pokemons
    assert_instance_of Hash, pokemons.first
  end

  def test_fetch_all_rock_pokemons
    pokemons = PokeClient.rock
    assert_instance_of Array, pokemons
    assert_instance_of Hash, pokemons.first
  end

  def test_fetch_all_fighting_pokemons
    pokemons = PokeClient.fighting
    assert_instance_of Array, pokemons
    assert_instance_of Hash, pokemons.first
  end

  def test_fetch_all_flying_pokemons
    pokemons = PokeClient.flying
    assert_instance_of Array, pokemons
    assert_instance_of Hash, pokemons.first
  end

  def test_fetch_all_ground_pokemons
    pokemons = PokeClient.ground
    assert_instance_of Array, pokemons
    assert_instance_of Hash, pokemons.first
  end

  def test_fetch_all_fire_pokemons
    pokemons = PokeClient.fire
    assert_instance_of Array, pokemons
    assert_instance_of Hash, pokemons.first
  end

  def test_fetch_all_water_pokemons
    pokemons = PokeClient.water
    assert_instance_of Array, pokemons
    assert_instance_of Hash, pokemons.first
  end
end
