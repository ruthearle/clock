require './app/time_machine'
require 'rack'
require File.expand_path('../config/environment', __FILE__)

map '/api/swagger' do
    run Rack::Directory.new('./app/public/')
end

Mongoid.load!("config/mongoid.yml")
#settings = { :prefix => "/clocks" }

#run InstaSwag.for(TimeMachine::API, settings)

run TimeMachine::API

