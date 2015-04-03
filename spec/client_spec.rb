require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

RSpec.describe VictorOps::Client do

  describe 'settings' do
    before do
      @client = VictorOps::Client.new api_url: 'test url', routing_key: 'test key', option: 'this is working'
    end

    it 'should return an OpenStruct hash with the input options hash as settings methods' do
      expect(@client.settings).to be_a(OpenStruct)
      expect(@client.settings.api_url).to eq 'test url'
      expect(@client.settings.routing_key).to eq 'test key'
      expect(@client.settings.option).to eq 'this is working'
      expect(@client.settings.not_a_passed_option).to be_nil
    end
  end

  context 'private methods' do
  	describe '.valid_settings?' do
      context 'settings include required items' do
        before do
          @client = VictorOps::Client.new api_url: 'test url', routing_key: 'test key'
        end

        it 'should return true' do
          expect(@client.send(:valid_settings?)).to be_truthy
        end
      end

      context 'settings do not include required items' do
        before do
          @client = VictorOps::Client.new api_url: 'test url', routing_key: 'test key'
          @client.settings.routing_key = nil
        end

        it 'should return false' do
          expect(@client.send(:valid_settings?)).to be_falsey
        end
      end
    end
  end

end