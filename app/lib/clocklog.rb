require 'log4r'
require 'log4r/yamlconfigurator'
require 'log4r/outputter/consoleoutputters'
require 'log4r/outputter/datefileoutputter'
require 'log4r/outputter/rollingfileoutputter'

module Clocklog

 class Log4rConfig

  include Log4r

  cfg = YamlConfigurator

  cfg.load_yaml_file('config/clocklog.yml')

  p cfg.inspect

  p Log4r::Logger.name

  def self.clocklog
    Logger['clocklog']
  end

  def self.test
    Logger['test']
  end

 end

end

