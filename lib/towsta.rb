#coding: utf-8
files = %w(cgi net/http json bresson cameraman active_support/all)
files.each {|file| require file}

module Towsta
  mattr_accessor :secret, :global, :author, :models_path, :env
end

files = %w(base attributes crud mail references)
files.each {|file| require "towsta/core/#{file}"}

files = %w(version synchronizer vertical sync_with_towsta)
files.each {|file| require "towsta/#{file}"}

files = %w(main boolean date datetime file formated gallery image integer link list money multiple password text user vertical video select)
files.each {|file| require "towsta/kinds/#{file}"}

require 'towsta/frameworks/rails' if defined? Rails
