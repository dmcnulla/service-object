# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version/version'

Gem::Specification.new do |spec|
  spec.name          = 'service-object'
  spec.version       = ServiceObject::VERSION
  spec.authors       = ['Dave McNulla']
  spec.email         = ['mcnulla@gmail.com']
  spec.description   = 'Rest client'
  spec.summary       = 'Small rest client developed to testing rest services.'
  spec.homepage      = 'https://github.com/dmcnulla/service-object'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.test_files    = spec.files.grep(/^features/)
  spec.require_paths = ['lib']

  spec.add_dependency 'rest_baby', '~> 1.5.1'
  spec.add_dependency 'json', '~> 1.8', '>= 1.8.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'cucumber', '~> 2.1', '>= 2.1.0'
  spec.add_development_dependency 'rspec', '~> 2.14', '>= 2.14.1'
  spec.add_development_dependency 'webmock', '~> 1.13', '>= 1.13.0'
  spec.add_development_dependency 'coveralls', '~> 0.7'
  spec.add_development_dependency 'simplecov', '~> 0.11'
  spec.add_development_dependency 'rubocop', '~> 0.39.0'
end
