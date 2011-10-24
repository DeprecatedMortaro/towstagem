require 'dalli'
set :cache, Dalli::Client.new

module Towsta

  class Memory

    def self.recover params
      puts 'USANDO CACHEEEEEEEEEEEEEEEEEEEEEEEEEE'
      if settings.cache.get(params.to_s)
        settings.cache.set(params.inspect.to_s,true)
        params.each do |key, value|
          cache_string =  "#{key} => #{value}"
          puts cache_string
          Object.const_set key.to_s, settings.cache.get(cache_string)
        end
      else
        Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path, :params => params
      end
    end

  end
end
