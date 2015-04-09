require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

RSpec.describe VictorOps::Defaults do
  describe 'MessageTypes' do
  	it 'should be have VictorOps defined values' do
      expect(VictorOps::Defaults::MessageTypes::INFO).to eq 'INFO'
      expect(VictorOps::Defaults::MessageTypes::WARN).to eq 'WARNING'
      expect(VictorOps::Defaults::MessageTypes::CRITICAL).to eq 'CRITICAL'
      expect(VictorOps::Defaults::MessageTypes::ACK).to eq 'ACKNOWLEDGEMENT'
      expect(VictorOps::Defaults::MessageTypes::RECOVERY).to eq 'RECOVERY'
    end
  end

  describe 'client defautlts' do
  	it 'should have generic defaults set' do
      expect(VictorOps::Defaults::HOST).to eq 'localhost'
      expect(VictorOps::Defaults::NAME).to eq 'ruby REST client'
  	end
  end

  describe 'daybreak defaults' do
    it 'should have defaults needed for daybreak persistence' do
      expect(VictorOps::Defaults::Daybreak::PATH).to eq '/tmp/victor_ops-client.db'
    end
  end
end