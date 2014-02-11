# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/capistrano/notifier/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "capistrano_notifier"
  spec.version       = Capistrano::Notifier::VERSION
  spec.authors       = ["Masaaki Isozu"]
  spec.email         = ["m.isozu@gmail.com"]
  spec.description   = %q{Notification email for capistrano3}
  spec.summary       = %q{Simple enough notification via email in capistrano3.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", "> 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
