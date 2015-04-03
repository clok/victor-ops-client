require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

RSpec.describe VictorOps::Client do
  describe "version" do
    it 'should be a string type' do
      expect(VictorOps::Client::VERSION).to be_a(String)
    end
  end
end