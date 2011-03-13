require File.expand_path('../towsta/tree', __FILE__)
require File.expand_path('../towsta/vertical', __FILE__)
require File.expand_path('../towsta/synchronizer', __FILE__)

module Towsta
end

Towsta::Synchronizer.new :secret => 'sGeQOCDIUUx9BrcFvRP5cqCqPA05ZGdVkq5H694rV8w9'
puts "Synchronized with a demo towsta site"
