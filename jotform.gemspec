# encoding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "jotform/version"

Gem::Specification.new do |s|
  s.name        = "jotform"
  s.version     =  JotForm::VERSION
  s.authors     = ["Filipe Dobreira"]
  s.email       = ["dobreira@gmail.com"]
  s.description = %q{Ruby wrapper around the JotForm Developer API}
  s.summary     = %q{JotForm API wrapper}
  s.homepage    = "https://github.com/filp/ruby-jotform"
  s.license     = "MIT"

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
end