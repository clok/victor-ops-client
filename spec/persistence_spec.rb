require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

RSpec.describe VictorOps::Client do
  before do
    @valid_params = { api_url: 'test url', routing_key: 'test key' }
  end

  context 'persistence layer' do
  	describe 'client does not want persistence' do
      before do
        @client = VictorOps::Client.new @valid_params.merge(persist: nil)
      end

    	it 'should not configure daybreak' do
        expect(@client.settings.test).to be_nil
      end
    end

    context 'client does want persistence' do
      before do
        @client = VictorOps::Client.new @valid_params.merge(persist: true, store_file: 'tmp/test.db')
      end

      after do
        @client.shutdown
      end

      it 'should configure daybreak' do
        expect(@client.settings.store_file).to eq 'tmp/test.db'
        expect(@client.db).to be_a(Daybreak::DB)
      end

      it 'should allow for interactions with the database directly' do
        @client.db.set! 'test', 'worked'
        expect(@client.db['test']).to eq 'worked'
        expect(@client.db.include?('test')).to be_truthy
        @client.db.delete 'test'
        expect(@client.db.include?('test')).to be_falsey
        expect(@client.db['test']).to be_nil
      end

      describe '.set' do
        it 'will allow the setting of persisted values' do
          @client.set('answer to all', 42)
          expect(@client.db['answer to all']).to eq 42
          @client.shutdown
          @client = VictorOps::Client.new @valid_params.merge(persist: true, store_file: 'tmp/test.db')
          expect(@client.db['answer to all']).to eq 42
        end
      end

      describe '.retrieve' do
        it 'will retrieve a persisted value' do
          @client.set('tester', 'woot')
          expect(@client.retrieve('tester')).to eq 'woot'
          expect(@client.retrieve('not in here')).to be_nil
          @client.shutdown
          @client = VictorOps::Client.new @valid_params.merge(persist: true, store_file: 'tmp/test.db')
          expect(@client.retrieve('tester')).to eq 'woot'
          expect(@client.retrieve('not in here')).to be_nil
        end
      end

      describe '.delete' do
        it 'will delete a persisted value' do
          @client.set('this will be deleted', 'woot')
          expect(@client.delete('tester')).to eq 'woot'
          @client.shutdown
          @client = VictorOps::Client.new @valid_params.merge(persist: true, store_file: 'tmp/test.db')
          expect(@client.delete('tester')).to be_nil
        end
      end      
    end
  end
end