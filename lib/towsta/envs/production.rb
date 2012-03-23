require 'dalli'
set :cache, Dalli::Client.new
require File.expand_path('../../memory', __FILE__)

def sync_with_towsta params={}
  sync = Towsta::Synchronizer.new params: params, request: :all
  (Dir["./controllers/*.rb"] + Dir["./models/*.rb"]).each {|file| load file}
  sync.status
end

#Towsta::Synchronizer.new params: {}, request: :structure

#def sync_with_towsta params={}
#  Towsta::Memory.recover(params).status
#end
