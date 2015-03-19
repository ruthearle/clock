require File.expand_path('../boot', __FILE__)

Bundler.require :default, ENV['RACK_ENV']

require File.expand_path('app/time_machine.rb')
