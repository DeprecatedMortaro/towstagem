#require File.expand_path('../towsta/tree', __FILE__)
require File.expand_path('../towsta/vertical', __FILE__)
require File.expand_path('../towsta/synchronizer', __FILE__)
require File.expand_path('../towsta/memory', __FILE__) if $towsta_cache

module Towsta
end

def sync_with_towsta params=nil
  params ||= {} if $towsta_sync
  $towsta_sync ||= {}
  params = $towsta_sync.merge(params) if params
  return Towsta::Memory.recover params if $towsta_cache
  Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path, :params => params
end
