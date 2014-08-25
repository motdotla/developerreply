# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'developerreply/version'

Gem::Specification.new do |gem|
  gem.name          = "developerreply"
  gem.version       = Developerreply::VERSION
  gem.authors       = ["scottmotte"]
  gem.email         = ["mot@mot.la"]
  gem.description   = %q{Ruby bindings for the SendGrid /developer/reply call.}
  gem.summary       = %q{Ruby bindings for the SendGrid /developer/reply call.}
  gem.homepage      = "http://github.com/scottmotte/developerreply"

  gem.add_dependency "faraday", "~> 0.8.9"
  gem.add_dependency "faraday_middleware", "~> 0.9.0"

  gem.add_development_dependency "foreman"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
