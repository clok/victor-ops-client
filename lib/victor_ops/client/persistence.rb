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
      db.flush
    end

    def retrieve(key)
      db[key]
    end

    def delete(key)
      value = db.delete key
      db.flush
      value
    end

    def shutdown
      db.flush
      db.compact
      db.close
    end
  end
end