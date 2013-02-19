# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplest_view/version'

Gem::Specification.new do |gem|
  gem.name          = "simplest_view"
  gem.version       = SimplestView::VERSION
  gem.authors       = ["Tony Pitale"]
  gem.email         = ["tpitale@gmail.com"]
  gem.description   = %q{SimplestView splits up views and templates in a Rails 3 application to make it easier to improve the code quality therein.}
  gem.summary       = %q{SimplestView splits up views and templates in a Rails 3 application to make it easier to improve the code quality therein.}
  gem.homepage      = "http://github.com/tpitale/simplest_view"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rails', '~> 3.2.0'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-mocks'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'capybara'
end
