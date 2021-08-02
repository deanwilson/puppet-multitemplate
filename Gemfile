source 'https://rubygems.org'

group :development, :test do
  gem 'json'
  gem 'puppetlabs_spec_helper', '~> 4.0.0'
  gem 'rake', '~> 13.0.0'
  gem 'rspec', '~> 3.10.0'
  gem 'rubocop', '~> 0.93.0', require: false
  gem 'rubocop-rspec', '~> 1.44.1', require: false
end

if (puppetversion = ENV['PUPPET_GEM_VERSION'])
  gem 'puppet', puppetversion, require: false
else
  gem 'puppet', require: false
end
