# frozen_string_literal: true

require_relative "lib/poke_client/version"

Gem::Specification.new do |spec|
  spec.name          = "poke_client"
  spec.version       = PokeClient::VERSION
  spec.authors       = ["Bryan Mendoza"]
  spec.email         = ["bmendoza5@ucol.mx"]

  spec.summary       = "Poke client"
  spec.description   = "Poke client"
  spec.homepage      = "https://rubygems.org"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://rubygems.org"
  # spec.metadata["changelog_uri"] = "https://rubygems.org"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata = {
    "rubygems_mfa_required" => "true"
  }
end
