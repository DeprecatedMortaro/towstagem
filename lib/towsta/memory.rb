require 'dalli'
require 'digest/md5'

set :cache, Dalli::Client.new

module Towsta

  class Memory

    def self.recover params
      md5 = Memory.md5(params)
      if settings.cache.get(md5)
        puts 'USANDO CACHEEEEEEEEEEEEEEEEEEEEEEEEEE'
        Towsta::Synchronizer.new :path => $towsta_path, :cache => settings.cache.get(md5)
      else
        puts 'CRIANDO CACHEEEEEEEEEEEEEEEEE'
        syn = Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path, :params => params
        settings.cache.set(md5,syn.json)
      end
    end

    def self.md5 params
      digest = Digest::MD5.hexdigest(params.inspect.to_s)
    end

  end
end
