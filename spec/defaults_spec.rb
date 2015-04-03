require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

RSpec.describe VictorOps::Defaults do
  describe 'MessageTypes' do
  	it 'should be a string type' do
      expect(VictorOps::Defaults::MessageTypes::INFO).to eq 'INFO'
      expect(VictorOps::Defaults::MessageTypes::WARN).to eq 'WARNING'
      expect(VictorOps::Defaults::MessageTypes::CRITICAL).to eq 'CRITICAL'
      expect(VictorOps::Defaults::MessageTypes::ACK).to eq 'ACKNOWLEDGMENT'
      expect(VictorOps::Defaults::MessageTypes::RECOVERY).to eq 'RECOVERY'
    end
  end
end