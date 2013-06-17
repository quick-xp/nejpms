source 'https://rubygems.org'

RAILS_VERSION = '~> 3.2.13'
DM_VERSION    = '~> 1.2.0'

gem 'activesupport',  RAILS_VERSION, :require => 'active_support'
gem 'actionpack',     RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',   RAILS_VERSION, :require => 'action_mailer'
gem 'activeresource', RAILS_VERSION, :require => 'active_resource'
gem 'railties',       RAILS_VERSION, :require => 'rails'
gem 'tzinfo',         '~> 0.3.32'

gem 'dm-rails',               '~> 1.2.1'
gem 'dm-sqlite-adapter', DM_VERSION

# You can use any of the other available database adapters.
# This is only a small excerpt of the list of all available adapters
# Have a look at
#
#  http://wiki.github.com/datamapper/dm-core/adapters
#  http://wiki.github.com/datamapper/dm-core/community-plugins
#
# for a rather complete list of available datamapper adapters and plugins

# gem 'dm-sqlite-adapter',    DM_VERSION
gem 'dm-mysql-adapter',     DM_VERSION
# gem 'dm-postgres-adapter',  DM_VERSION
# gem 'dm-oracle-adapter',    DM_VERSION
# gem 'dm-sqlserver-adapter', DM_VERSION

gem 'dm-migrations',   DM_VERSION
gem 'dm-types',        DM_VERSION
gem 'dm-validations',  DM_VERSION
gem 'dm-constraints',  DM_VERSION
gem 'dm-transactions', DM_VERSION
gem 'dm-aggregates',   DM_VERSION
gem 'dm-timestamps',   DM_VERSION
gem 'dm-observer',     DM_VERSION
gem 'dm-validations-i18n', '~> 0.3.10'
gem 'dm-twowaysql', '~> 0.1.0'
gem 'dm-sql-finders', '~> 0.0.3'
gem 'strong_parameters'
gem 'dotenv'
gem 'virtus', '~> 0.5.4'
gem 'draper', '~> 1.2.0'
gem 'twitter-bootstrap-rails'
gem 'xml-object'
gem 'devise'
gem 'reform'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '~> 1.2.4'
  gem 'less-rails'
  gem 'jquery-rails'
  gem 'bootstrap-sass-rails', '~> 2.3.1.0'
  gem 'bootstrap-datepicker-rails', '~> 0.6.8'
  gem 'therubyracer', '~> 0.10.2', :platform => :ruby
  gem 'jquery-datatables-rails'
end

group :test, :development do
  gem 'rspec-rails', "~> 2.0"
  gem 'pry-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
end



# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.1'

# Use unicorn as the web server
# gem 'unicorn', '~> 4.2.1'

# Deploy with Capistrano
# gem 'capistrano', '~> 2.11.2'

# To use debugger
# gem 'ruby-debug19', '~> 0.11.6', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.9.4', :require => false
end
