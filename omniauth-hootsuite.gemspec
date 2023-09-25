# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-hootsuite/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Blockspring"]
  gem.email         = ["jason@blockspring.com"]
  gem.description   = %q{OmniAuth strategy for Hootsuite.}
  gem.summary       = %q{OmniAuth strategy for Hootsuite.}
  gem.homepage      = "https://github.com/blockspring/omniauth-hootsuite"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-hootsuite"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Hootsuite::VERSION

  gem.add_dependency 'omniauth-oauth2', '~> 1.8'

  gem.add_development_dependency 'rspec', '~> 3.4'
  gem.add_development_dependency 'rack-test', '~> 2.1'
  gem.add_development_dependency 'webmock', '~> 3.19', '>= 3.19.1'
  gem.add_development_dependency 'simplecov', '~> 0.22.0'
  gem.add_development_dependency 'faraday', '~> 2.7', '>= 2.7.11'
end
