require 'dalli'
set :cache, Dalli::Client.new

module Towsta
  class Memory
    def recover params
      params.each do |key, value|
        cache_string =  "#{key} => #{value}"
      end
      Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path, :params => params
    end
  end
end

#get '/' do
#  if settings.cache.get('teste')
#    haml settings.cache.get('teste')
#  else
#    haml Teste.first.id
#  end
#end
