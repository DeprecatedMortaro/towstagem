require 'dalli'
require 'digest/md5'

set :cache, Dalli::Client.new

module Towsta

  class Memory

    def self.recover params
      if settings.cache.get(params.to_s)
        puts 'USANDO CACHEEEEEEEEEEEEEEEEEEEEEEEEEE'
        params.each do |key, value|
          Object.const_set key.to_s, settings.cache.get(Memory.md5(key,value))
        end
      else
        puts 'CRIANDO CACHEEEEEEEEEEEEEEEEE'
        Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path, :params => params
        settings.cache.set(params.inspect.to_s,true)
        params.each do |key, value|
          settings.cache.set(Memory.md5(key,value),eval(key.to_s))
        end
      end
    end

    def self.md5 key, value
      digest = Digest::MD5.hexdigest(key.to_s+value.to_s)
    end

  end
end
