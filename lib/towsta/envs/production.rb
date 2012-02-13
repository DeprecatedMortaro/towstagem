require "./towsta.rb"

require 'dalli'
set :cache, Dalli::Client.new
require File.expand_path('../../memory', __FILE__)

Towsta::Synchronizer.new params: {}, request: :structure

(Dir["./controllers/*.rb"] + Dir["./models/*.rb"]).each {|file| require file}

def sync_with_towsta params={}
  Towsta::Memory.recover(params).status
end
