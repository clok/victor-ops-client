require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

RSpec.describe VictorOps::Defaults do
  describe 'message types' do
    it 'should be a string type' do
      expect(VictorOps::Defaults::MESSAGE_TYPES).to be_a(Array)
    end
  end
end