# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mootools/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'mootools-rails'
  spec.version       = Mootools::Rails::VERSION
  spec.authors       = 'Daniel Spangenberg'
  spec.email         = 'danielsp@parcydo.com'
  spec.description   = 'Use MooTools with Rails 3'
  spec.summary       = 'This gem provides MooTools and the MooTools-ujs driver for your Rails 3 application.'
  spec.homepage      = 'http://github.com/neonlex/mootools-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = 'lib'

  spec.add_dependency 'railties', '>= 3.0', '< 5.0'
  spec.add_dependency 'thor',     '>= 0.14', '< 2.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
