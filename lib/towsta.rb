#coding: utf-8
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
require 'active_support/all'

require File.expand_path('../towsta/vertical-core/base', __FILE__)
require File.expand_path('../towsta/vertical-core/attributes', __FILE__)
require File.expand_path('../towsta/vertical-core/crud', __FILE__)
require File.expand_path('../towsta/vertical-core/locales', __FILE__)
require File.expand_path('../towsta/vertical-core/mail', __FILE__)
require File.expand_path('../towsta/vertical-core/references', __FILE__)
require File.expand_path('../towsta/kinds/main', __FILE__)
require File.expand_path('../towsta/vertical', __FILE__)
require File.expand_path('../towsta/synchronizer', __FILE__)
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

module Towsta
  mattr_accessor :secret, :global, :author
end

require File.expand_path("../towsta/envs/#{ENV['RACK_ENV'] || 'development'}", __FILE__)
