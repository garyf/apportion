# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apportion/version'

Gem::Specification.new do |spec|
  spec.name          = "apportion"
  spec.version       = Apportion::VERSION
  spec.authors       = ["Gary Fleshman"]
  spec.email         = ["gfleshman@newforge-tech.com"]

  spec.summary       = 'Apportion for Ruby'
  spec.description   = 'Ruby implementation for apportionment'
  spec.homepage      = 'https://github.com/garyf/apportion'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'json', '~> 1.8'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'minitest', '~> 5.8'
  spec.add_development_dependency 'minitest-reporters', '~> 1.1'
  spec.add_development_dependency 'rake', '~> 10.5'
  spec.add_development_dependency 'simplecov', '~> 0.11'
  spec.add_development_dependency 'yard', '~> 0.8'
end
