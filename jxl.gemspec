# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'jxl/version'

Gem::Specification.new do |s|
  s.name        = "jxl"
  s.version     = Jxl::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dominique Broeglin"]
  s.email       = ["dominique.broeglin@gmail.com"]
  s.homepage    = "https://github.com/dbroeglin/jxl"
  s.summary     = "A simple DSL on top of the JExcelAPI library"
  s.description = "Allows to create XLS files in JRuby with a very simple DSL on top of JExcelAPI"
  s.required_rubygems_version = ">= 1.3.6"

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.0'

  s.require_path = 'lib'
end
