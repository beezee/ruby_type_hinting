# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'type_hinting/version'

Gem::Specification.new do |spec|
  spec.name          = "type_hinting"
  spec.version       = TypeHinting::VERSION
  spec.authors       = ["Brian Zeligson"]
  spec.email         = ["bzeligson@localytics.com"]
  spec.summary       = %q{Get type safety in your Ruby code}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-debugger"
end
