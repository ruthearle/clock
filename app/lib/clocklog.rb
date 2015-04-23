require 'log4r'
require 'log4r/yamlconfigurator'
require 'log4r/outputter/consoleoutputters'
require 'log4r/outputter/datefileoutputter'
require 'log4r/outputter/rollingfileoutputter'

module Clocklog

 class Log4rConfig

  include Log4r

  log_config = YamlConfigurator

  log_config.load_yaml_file('config/clocklog.yml')

  def self.clocklog
    Logger['clocklog']
  end

  def self.test
    Logger['test']
  end

 end

end

