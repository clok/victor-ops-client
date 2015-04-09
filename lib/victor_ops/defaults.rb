module VictorOps
  module Defaults
  	HOST = 'localhost'
  	NAME = 'ruby REST client'
    
    module MessageTypes
      INFO = 'INFO'
      WARN = 'WARNING'
      ACK  = 'ACKNOWLEDGEMENT'
      CRITICAL = 'CRITICAL'
      RECOVERY = 'RECOVERY'
    end

    module Daybreak
      PATH = '/tmp/victor_ops-client.db'
    end
  end
end