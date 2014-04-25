# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yard/metasploit/erd/version'

Gem::Specification.new do |spec|
  spec.name          = 'yard-metasploit-erd'
  spec.version       = YARD::Metasploit::ERD::VERSION
  spec.authors       = ['Luke Imhoff']
  spec.email         = ['luke_imhoff@rapid7.com']
  spec.summary       = 'YARD plugin that add Metasploit::ERDs to namespaces and classes'
  spec.description   = "YARD plugin that uses metasploit-erd to add Entity-Relationship Diagrams to each namespace " \
                       "Module and ActiveRecord::Base subclass's documentation."
  spec.homepage      = 'https://github.com/rapid7/yard-metasploit-erd'
  spec.license       = 'BSD-3-clause'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
