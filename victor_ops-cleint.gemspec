$:.push File.expand_path("../lib", __FILE__)
require 'victor_ops/client/version'

Gem::Specification.new do |s|
  s.name        = 'victor_ops-client'
  s.version     = VictorOps::Client::VERSION
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = "VictorOps Client"
  s.description = "A gem that will allow for consistent usage of the VictorOps service from within a script or daemon."
  s.authors     = ["Derek Smith"]
  s.email       = 'derek@clokwork.net'
  s.homepage    = 'http://clokwork.net'
  
  s.files         = `git ls-files`.split("\n").compact
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 1.9.3'
  #s.add_dependency 'httparty', '~> 0.10', '>= 0.10.2'
  #s.add_dependency 'highline', '~> 1.7', '>= 1.7'
  s.add_development_dependency "rspec", '~> 3.0'

  s.license = 'MIT'
end