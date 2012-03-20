require 'dalli'
set :cache, Dalli::Client.new
require File.expand_path('../../memory', __FILE__)

Towsta::Synchronizer.new params: {}, request: :structure

def sync_with_towsta params={}
  Towsta::Memory.recover(params).status
end
