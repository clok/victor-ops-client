module VictorOps
  class Client
    require 'daybreak'
    
    attr_accessor :db

    def configure_data_store
      settings.store_file = VictorOps::Defaults::Daybreak::PATH unless settings.store_file
      @db = Daybreak::DB.new settings.store_file
      ObjectSpace.define_finalizer(self, proc { shutdown })
    end

    def set(key, value)
      db.set! key, value
    end

    def retrieve(key)
      db[key]
    end

    def delete(key)
      db.delete! key
    end

    def shutdown
      db.flush
      db.compact
      db.close
    end
  end
end