# coding: utf-8
require File.expand_path('../lib/mootools/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'mootools-rails'
  s.version     = Mootools::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'Daniel Spangenberg'
  s.email       = 'daniel@spangenberg.io'
  s.homepage    = 'http://rubygems.org/gems/mootools-rails'
  s.summary     = 'Use MooTools with Rails 3'
  s.description = 'This gem provides MooTools and the MooTools-ujs driver for your Rails 3 application.'
  s.license     = 'MIT'

  s.files        = `git ls-files`.split($/)
  s.require_path = 'lib'

  s.add_dependency 'railties', '>= 3.0'
  s.add_dependency 'thor',     '>= 0.14', '< 2.0'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
end
