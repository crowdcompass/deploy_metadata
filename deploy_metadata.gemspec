# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deploy_metadata/version'

Gem::Specification.new do |spec|
  spec.name          = "deploy_metadata"
  spec.version       = DeployMetadata::VERSION
  spec.authors       = ["Ben Cullen-Kerney"]
  spec.email         = ["ben@beancuke.com"]
  spec.summary       = %q{Deploys metadata}
  spec.description   = %q{Records and caches the start time, deploy time (with standard capistrano deploy), and git revision of your running app.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
