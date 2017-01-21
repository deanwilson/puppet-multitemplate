#!ruby
source 'https://rubygems.org'

group :development, :test do
  gem 'json'
  gem 'puppetlabs_spec_helper', '~> 1.1.1'
  gem 'rake', '~> 11.2.0'
  gem 'rspec', '~> 3.5.0'
  gem 'rubocop', '~> 0.47.1', require: false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end
