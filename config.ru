require './app/time_machine'
require 'grape'
require 'rack'

run TimeMachine::API
