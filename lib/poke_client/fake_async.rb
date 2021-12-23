# frozen_string_literal: true

module PokeClient
  class Async
    def map(range)
      threads = []
      range.each do |i|
        threads << Thread.new { yield(i) }
      end
      threads.each(&:join)
    end
  end
end
