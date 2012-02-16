# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "towsta/version"

Gem::Specification.new do |s|

  s.name        = "towsta"
  s.version     = Towsta::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mortaro"]
  s.email       = ["mortaro@towsta.com"]
  s.homepage    = "http://rubygems.org/gems/towsta"
  s.summary     = %q{Api Integration gem with towsta}
  s.description = %q{Simply integrates the towsta api}
  s.platform    = $platform || RUBY_PLATFORM[/java/] || 'ruby'

  s.rubyforge_project = "towsta"

  s.add_dependency "json"
  s.add_dependency "bresson"
  s.add_dependency "compass"
  s.add_dependency "haml"
  s.add_dependency "sinatra"
  s.add_dependency "cameraman"
  s.add_dependency "sinatra-content-for"
  s.add_dependency "i18n-router"
  s.add_dependency "pony"
  s.add_dependency "coffee-script"
  s.add_dependency "active_support"
  s.add_dependency 'dalli'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'shotgun'
  s.add_development_dependency 'heroku'

  s.add_dependency "therubyracer" if !!s.platform.match("win")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end
