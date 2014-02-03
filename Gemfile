source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'
gem 'unicorn'
gem 'pg'
gem 'haml-rails'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'devise'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'thin' 
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-livereload'
  gem 'debugger'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'letter_opener'
  gem 'factory_girl_rails'
  gem "erb2haml"
end

gem 'rspec-rails', :group => [:test, :development]

group :test do 
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]