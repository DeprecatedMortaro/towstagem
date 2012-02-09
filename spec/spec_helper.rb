ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'towsta'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end
