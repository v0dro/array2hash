# coding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)

require 'array2hash/version.rb'

Array2Hash::DESCRIPTION = <<MSG
Efficient conversion of a Ruby Array to a lookup table-like Hash written in Rubex via a C extension.
MSG

Gem::Specification.new do |spec|
  spec.name          = 'array2hash'
  spec.version       = Array2Hash::VERSION
  spec.authors       = ['Sameer Deshmukh']
  spec.email         = ['sameer.deshmukh93@gmail.com']
  spec.summary       = Array2Hash::DESCRIPTION
  spec.description   = Array2Hash::DESCRIPTION
  spec.homepage      = "http://github.com/v0dro/array2hash"
  spec.license       = 'BSD-2'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rubex', '~> 0.1'
end
