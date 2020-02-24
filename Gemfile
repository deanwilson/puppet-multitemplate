#!ruby
source 'https://rubygems.org'

group :development, :test do
  gem 'json'
  gem 'puppetlabs_spec_helper', '~> 2.14.1'
  gem 'rake', '~> 13.0.0'
  gem 'rspec', '~> 3.9.0'
  gem 'rubocop', '~> 0.80.0', require: false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end
