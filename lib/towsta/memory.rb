require 'dalli'
set :cache, Dalli::Client.new

module Towsta

  class Memory

    def self.recover params
      if settings.cache.get(params.to_s)
        puts 'USANDO CACHEEEEEEEEEEEEEEEEEEEEEEEEEE'
        params.each do |key, value|
          cache_string =  "testetetas"#"#{key} #{value}"
          puts cache_string
          Object.const_set key.to_s, settings.cache.get(cache_string)
        end
      else
        puts 'CRIANDO CACHEEEEEEEEEEEEEEEEE'
        Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path, :params => params
        settings.cache.set(params.inspect.to_s,true)
        params.each do |key, value|
          cache_string =  "testetetas"#"#{key} #{value}"
          settings.cache.set(cache_string,eval(key.to_s))
        end
      end
    end

  end
end
