require 'simplecov'
SimpleCov.start

require 'victor_ops/client'
require 'json'

def file_fixture(filename)
  open(File.join(File.dirname(__FILE__), 'fixtures', "#{filename.to_s}")).read
end

def file_fixture_to_json(filename)
  JSON::parse(open(File.join(File.dirname(__FILE__), 'fixtures', "#{filename.to_s}")).read)
end

def file_fixture_path(filename)
  File.join(File.dirname(__FILE__), 'fixtures', "#{filename.to_s}")
end

def open_tmp_file(filename)
  open(File.join(File.dirname(__FILE__), '..', 'tmp', "#{filename.to_s}")).read
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = false
  end

  # config.filter_run :focus
  # config.run_all_when_everything_filtered = true
  # config.profile_examples = 10

  config.disable_monkey_patching!

  config.warnings = false

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end


  config.order = :random
  Kernel.srand config.seed

  config.after(:suite) do
    FileUtils.rm('tmp/test.db') if File.exist? 'tmp/test.rb'
  end
end