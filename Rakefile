ENV['CODECLIMATE_REPO_TOKEN'] = '86322de3b5909460dccb9d35d43d90178899a4887fefc28b2bf6ac5818708918'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task default: [:spec]