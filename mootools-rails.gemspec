# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mootools-rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "mootools-rails"
  s.version     = Mootools::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Daniel Spangenberg"]
  s.email       = ["daniel.spangenberg@parcydo.com"]
  s.homepage    = "http://rubygems.org/gems/mootools-rails"
  s.summary     = "Use MooTools with Rails 3"
  s.description = "This gem provides MooTools and the MooTools-ujs driver for your Rails 3 application."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "mootools-rails"

  s.add_dependency "railties", "~> 3.0"
  s.add_dependency "thor",     "~> 0.14"
  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "rails",   "~> 3.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
end