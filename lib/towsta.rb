#coding: utf-8
require 'dalli'
require 'digest/md5'
require 'net/http'
require 'cgi'
require 'json'
require 'time'
require 'date'
require 'time'
require 'bresson'
require 'sinatra'
require 'compass'

Dir[File.expand_path('./lib/**/*.rb')].each {|file| require file }

#require File.expand_path('../towsta/vertical', __FILE__)
#require File.expand_path('../towsta/synchronizer', __FILE__)
#require File.expand_path('../towsta/memory', __FILE__)
#require File.expand_path('../towsta/sinatra_extension', __FILE__)
#
#Dir[File.expand_path('../towsta/kinds/*.rb', __FILE__)].each {|file| require file }

module Towsta
end

def sync_with_towsta params=nil
  params ||= {} if $towsta_sync
  $towsta_sync ||= {}
  params = $towsta_sync.merge(params) if params
  if $towsta_cache
    Towsta::Memory.recover params
  else
    Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path, :params => params
  end
  begin
    Dir["./models/*.rb"].each {|file| load file }
  rescue; end;
end

def clear_sync
  Towsta::Memory.flush
end
