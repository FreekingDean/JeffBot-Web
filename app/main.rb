#!/usr/bin/env ruby
$stdout.sync = true
require 'rubygems'
require 'sinatra'
require 'slim'
require 'awesome_print'
require 'json'
require_relative 'lib/mqwrapper'

set :port, ENV['PORT'] || 8080
set :bind, ENV['IP'] || '0.0.0.0'

##
# Index page of site featuring chat window.
get '/' do
  slim :chathome
end

post '/api/actions/main' do
  ap params
  headers['Content-Type'] = 'application/json'
  {
    conversation_token: 'test',
    expect_user_response: true,
    response: 'tester'
  }.to_json
end

post '/api/actions/chat' do
  ap params
  'sup'
end
##
# Simple API endpoint for getting response to query
post '/api/v1/post' do
  ap params
  MQWrapper.send(params['arg'])
end
