# PokeClient

PokeClientAPI is a simple wrapper to manage pokemons using his types with the pokeApi as source. The estandar response consis in an array of hashes with the pokemon id and type each has, example: `[{:id=>"1", :name=>"bulbasaur"}]` <br/>
See entire documentation in: https://pokeapi.co/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'poke_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install poke_client

## Usage

How to use this gem.
* Import this gem in your proyect.
* Afther that you can use all the automatic funcionalitty

```ruby
PokeClient.all
PokeClient.rock # or some pokemon type
```

Current available types suported:
[`normal, fighting, flying, ground, rock, fire, water`]
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bryanmg/poke_client.
