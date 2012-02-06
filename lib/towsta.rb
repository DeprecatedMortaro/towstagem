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
require 'cameraman'
require 'sinatra'
require 'compass'
require 'sinatra/content_for'
require 'i18n-router'
require 'pony'

require File.expand_path('../towsta/vertical-core/base', __FILE__)
require File.expand_path('../towsta/vertical-core/attributes', __FILE__)
require File.expand_path('../towsta/vertical-core/crud', __FILE__)
require File.expand_path('../towsta/vertical-core/locales', __FILE__)
require File.expand_path('../towsta/vertical-core/mail', __FILE__)
require File.expand_path('../towsta/vertical-core/references', __FILE__)
require File.expand_path('../towsta/string_extension', __FILE__)
require File.expand_path('../towsta/kinds/main', __FILE__)
require File.expand_path('../towsta/vertical', __FILE__)
require File.expand_path('../towsta/synchronizer', __FILE__)
require File.expand_path('../towsta/memory', __FILE__)
require File.expand_path('../towsta/sinatra_extension', __FILE__)
require File.expand_path('../towsta/login', __FILE__)
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
require File.expand_path('../towsta/kinds/video', __FILE__)
require File.expand_path('../towsta/kinds/multiple', __FILE__)

Dir["./controllers/*.rb"].each {|file| require file}

def sync_with_towsta params=nil
  params ||= {} if $towsta_sync
  $towsta_sync ||= {}
  params = $towsta_sync.merge(params) if params
  $towsta_cache ||= production?
  if $towsta_cache
    Towsta::Memory.recover params
  else
    #Towsta::Synchronizer.new :secret => $towsta_secret, :path => $towsta_path, :params => params
    Towsta::Synchronizer.new secret: $towsta_secret, params: params, request: :all
  end
  Dir["./models/*.rb"].each {|file| load file }
end

def clear_sync
  Towsta::Memory.flush
end
