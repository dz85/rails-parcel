require 'parcel/version'
require 'parcel/runner'
require 'parcel/configuration' if defined?(Rails)
require 'parcel/railtie' if defined?(Rails)
require 'logger'

module Parcel
  def self.setup
    yield(Configuration.config) if block_given?
  end

  def self.logger
    logger = Logger.new($stderr)
    logger.level = Logger::INFO
    logger
  end
end
