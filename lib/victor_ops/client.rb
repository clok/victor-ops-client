require 'victor_ops/defaults'
require 'victor_ops/client/version'
require 'victor_ops/client/exceptions'
require 'ostruct'
require 'awesome_print'

module VictorOps
  class Client
    require 'rest-client'

    def initialize(opts)
      @settings = OpenStruct.new opts
      AwesomePrint.defaults = { indent: -2, plain: true }
      raise VictorOps::Client::MissingSettings unless valid_settings?
    end

    def settings
      @settings
    end

    def entity_display_name
      true
    end

    def monitoring_tool
      true
    end

    private

    def epochtime
      Time.now.to_i
    end

    def critical_data(msg)
      {
        message_type: VictorOps::Defaults::MessageTypes::CRITICAL,
        timestamp: epochtime,
        entity_display_name: entity_display_name,
        monitoring_tool: monitoring_tool,
        state_message: msg.ai
      }
    end

    def warn_data(msg)
      {
        message_type: VictorOps::Defaults::MessageTypes::WARN,
        timestamp: epochtime,
        entity_display_name: entity_display_name,
        monitoring_tool: monitoring_tool,
        state_message: msg.ai
      }
    end

    def info_data(msg)
      {
        message_type: VictorOps::Defaults::MessageTypes::INFO,
        timestamp: epochtime,
        entity_display_name: entity_display_name,
        monitoring_tool: monitoring_tool,
        state_message: msg.ai
      }
    end

    def ack_data(msg)
      {
        message_type: VictorOps::Defaults::MessageTypes::ACK,
        timestamp: epochtime,
        entity_display_name: entity_display_name,
        monitoring_tool: monitoring_tool,
        state_message: msg.ai
      }
    end

    def recovery_data(msg)
      {
        message_type: VictorOps::Defaults::MessageTypes::RECOVERY,
        timestamp: epochtime,
        entity_display_name: entity_display_name,
        monitoring_tool: monitoring_tool,
        state_message: msg.ai
      }
    end

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