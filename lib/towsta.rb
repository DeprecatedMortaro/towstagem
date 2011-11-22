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

require File.expand_path('../towsta/kinds/main', __FILE__)
require File.expand_path('../towsta/vertical', __FILE__)
require File.expand_path('../towsta/synchronizer', __FILE__)
require File.expand_path('../towsta/memory', __FILE__)
require File.expand_path('../towsta/sinatra_extension', __FILE__)
require File.expand_path('../towsta/kinds/boolean', __FILE__)
require File.expand_path('../towsta/kinds/date', __FILE__)
require File.expand_path('../towsta/kinds/datetime', __FILE__)
require File.expand_path('../towsta/kinds/file', __FILE__)
require File.expand_path('../towsta/kinds/formated', __FILE__)
require File.expand_path('../towsta/kinds/gallery', __FILE__)
require File.expand_path('../towsta/kinds/image', __FILE__)
require File.expand_path('../towsta/kinds/integer', __FILE__)
require File.expand_path('../towsta/kinds/link', __FILE__)
require File.expand_path('../towsta/kinds/list', __FILE__)
require File.expand_path('../towsta/kinds/money', __FILE__)
require File.expand_path('../towsta/kinds/password', __FILE__)
require File.expand_path('../towsta/kinds/text', __FILE__)
require File.expand_path('../towsta/kinds/user', __FILE__)
require File.expand_path('../towsta/kinds/vertical', __FILE__)

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
