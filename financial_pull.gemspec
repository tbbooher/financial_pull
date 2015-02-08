# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'financial_pull/version'

Gem::Specification.new do |spec|
  spec.name          = 'financial_pull'
  spec.version       = FinancialPull::VERSION
  spec.authors       = ['Tim Booher']
  spec.email         = ['tim@theboohers.org']
  spec.summary       = %q{This gem downloads financial data}
  spec.description   = %q{Connect to your bank via ofx and get your data in a variety of formats}
  spec.homepage      = 'http://www.theboohers.org/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'dotenv-rails'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-nc'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-remote'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rb-fsevent', '~> 0.9.1'
  # spec.add_runtime_dependency 'ofx_for_ruby', git: 'https://github.com/tbbooher/ofx_for_ruby'
end
