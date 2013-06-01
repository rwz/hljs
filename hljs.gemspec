# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hljs/version'

Gem::Specification.new do |spec|
  spec.name          = "hljs"
  spec.version       = HLJS::VERSION
  spec.authors       = ["Pavel Pravosud"]
  spec.email         = ["pavel@pravosud.com"]
  spec.description   = %q{Ruby wrapper for javascript code highlighting libraries}
  spec.summary       = %q{Allows to use javascript code highlighters from ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency             "execjs",  "~> 1.4"
  spec.add_development_dependency "bundler", "~> 1.3"
end
