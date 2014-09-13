# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_keys_rename/version'

Gem::Specification.new do |spec|
  spec.name          = "hash_keys_rename"
  spec.version       = HashKeysRename::VERSION
  spec.authors       = ["Oleg Sviridovitch"]
  spec.email         = ["oleg.sviridovitch@gmail.com"]
  spec.summary       = %q{append ability to rename hash keys deeply}
  spec.homepage      = "https://github.com/olsv/hash_keys_rename"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(rspec|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
