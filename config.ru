require 'sinatra'
require 'sinatra/base'
require 'json'
require 'dotenv'
require 'logger'

require File.join(File.dirname(__FILE__), 'src', 'main')

use Rack::Reloader, 0
run Main
