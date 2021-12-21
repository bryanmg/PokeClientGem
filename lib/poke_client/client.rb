# frozen_string_literal: true
require "json"
require "net/http"

module PokeClient
    class Error < StandardError; end

    class Client
        def initialize
            @base_path = "https://pokeapi.co/api/v2/"
        end

        def all(path, **args)
            uri = uri_path(path, **args)
            req = Net::HTTP.get(uri)
            create_response(req)
        end

        private

        attr_reader :base_path

        def create_response(request)
            res = []
            body = JSON.parse(request) #body = body.transform_keys(&:to_sym)
            body = body["results"] || body["pokemon"]
            if body.first&.include?("pokemon")
                body.each { |x| res << {id: x["pokemon"]["url"].split("/")[-1], name: x["pokemon"]["name"]} }
            else
                body.each { |x| res << {id: x["url"].split("/")[-1], name: x["name"]}  }
            end
            res
        rescue JSON::ParserError
            nil
        end

        def uri_path(path, **args)
            uri = URI.join(base_path, path)
            uri.query = URI.encode_www_form args.fetch(:query, {}).compact
            uri
        end
    end
end
