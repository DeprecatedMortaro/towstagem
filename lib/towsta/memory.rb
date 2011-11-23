set :cache, Dalli::Client.new

module Towsta

  class Memory

    def self.recover params
      md5 = Memory.md5(params)
      if settings.cache.get(md5)
        puts "\nUsing cache to Towst"
        Towsta::Synchronizer.new :path => $towsta_path, :cache => settings.cache.get(md5), :secret => $towsta_secret
      else
        puts "\nCreating cache"
        syn = Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path, :params => params
        settings.cache.set(md5,syn.response)
      end
    end

    def self.flush
      settings.cache.flush
    end

    def self.md5 params
      digest = Digest::MD5.hexdigest(params.inspect.to_s + 'Towsta')
    end

  end
end
