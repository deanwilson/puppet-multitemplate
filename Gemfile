source 'https://rubygems.org'

group :development, :test do
  gem 'json'
  gem 'puppetlabs_spec_helper', '~> 6.0.0'
  gem 'rake', '~> 13.0.0'
  gem 'rspec', '~> 3.12.0'
  gem 'rubocop', '~> 1.50.0', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', '~> 2.22.0', require: false
end

if (puppetversion = ENV.fetch('PUPPET_GEM_VERSION', nil))
  gem 'puppet', puppetversion, require: false
else
  gem 'puppet', require: false
end
