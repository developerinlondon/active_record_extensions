# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_extensions/version'

Gem::Specification.new do |spec|
  spec.name          = "active_record_extensions"
  spec.version       = ActiveRecordExtensions::VERSION
  spec.authors       = ["Nayeem Syed"]
  spec.email         = ["developerinlondon@gmail.com"]
  spec.summary       = %q{Add update_or_create and delete_then_create to ActiveRecord models}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3-ruby"
  spec.add_dependency "activerecord", "~> 4.0"
end
