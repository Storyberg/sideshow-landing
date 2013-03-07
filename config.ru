require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'mongo'

require './application'

run Sinatra::Application