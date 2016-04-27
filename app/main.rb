#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'slim'
require 'awesome_print'
require_relative 'lib/mqwrapper'

set :port, ENV['PORT'] || 8080
set :bind, ENV['IP'] || '0.0.0.0'

##
# Index page of site featuring chat window.
get '/' do
  slim :chathome
end

##
# Simple API endpoint for getting response to query
post '/api/v1/post' do
  ap params
  MQWrapper.send(params['arg'])
end
