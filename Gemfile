source 'https://rubygems.org'
ruby "1.9.3"

RAILS_VERSION = '~> 3.2.6'
DM_VERSION    = '~> 1.2.0'

gem 'activesupport',  RAILS_VERSION, :require => 'active_support'
gem 'actionpack',     RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',   RAILS_VERSION, :require => 'action_mailer'
gem 'activeresource', RAILS_VERSION, :require => 'active_resource'
gem 'railties',       RAILS_VERSION, :require => 'rails'
gem 'tzinfo',         '~> 0.3.32'

gem 'dm-rails',               '~> 1.2.1'
gem 'dm-postgres-adapter', DM_VERSION

gem 'dm-migrations',   DM_VERSION
gem 'dm-types',        DM_VERSION
gem 'dm-validations',  DM_VERSION
gem 'dm-constraints',  DM_VERSION
gem 'dm-transactions', DM_VERSION
gem 'dm-aggregates',   DM_VERSION
gem 'dm-timestamps',   DM_VERSION
gem 'dm-observer',     DM_VERSION
gem 'dm-devise'
gem 'dm-accepts_nested_attributes_for'
gem 'cancan', :git => "https://github.com/ryanb/cancan.git", :branch => "2.0"

gem 'formtastic'
gem 'haml-rails'
gem 'exceptional'
gem 'yettings'
gem 'rabl'
gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1'
  gem 'bootstrap-sass', '~> 2.0.3'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '~> 1.2.4'
end

gem 'jquery-rails', '~> 2.0.0'
gem 'jquery-ui-rails'
gem 'hpricot'
gem 'ruby_parser'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.1'

# Use unicorn as the web server
# gem 'unicorn', '~> 4.2.1'

# Deploy with Capistrano
# gem 'capistrano', '~> 2.11.2'

group :test, :development do
  # Pretty printed test output
  gem 'debugger'
  gem 'turn', '~> 0.9.4', :require => false
  gem 'rspec'
  gem 'rspec-rails'
  gem 'dm-rspec2', '~> 0.2.3'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-webkit'
end
