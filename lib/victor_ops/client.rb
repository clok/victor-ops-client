require 'victor_ops/client/version'
require 'victor_ops/client/exceptions'
require 'ostruct'

module VictorOps
  class Client
    require 'rest-client'

    def initialize(opts={})
      @settings = OpenStruct.new opts
      raise VictorOps::Client::MissingSettings unless valid_settings?
    end

    def settings
      @settings
    end

    private

    def valid_settings?
      valid = true
      [:api_url, :routing_key].each do |k|
        next if valid == false
        valid = false unless settings.send(k)
      end
      valid
    end

  end
end