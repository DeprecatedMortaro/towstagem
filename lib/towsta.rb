#require File.expand_path('../towsta/tree', __FILE__)
require File.expand_path('../towsta/vertical', __FILE__)
require File.expand_path('../towsta/synchronizer', __FILE__)

module Towsta
end

def sync_with_towsta
  Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path
end
