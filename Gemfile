source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1'
gem 'unicorn'
gem 'pg'
gem 'haml-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'devise'
gem 'stripe'
gem 'pundit', github: 'stgeneral/pundit', branch: 'rspec3-deprecations' # fix rspec complain
gem 'rmagick', require: false
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave', ref: 'c2ee2e8' # fix rspec complain

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'sass-rails'
gem 'compass-rails', github: 'Compass/compass-rails', branch: 'master'
gem 'compass-normalize'
gem 'susy'

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
  gem "erb2haml"
  gem "awesome_print"
  gem "rails-erd"
end

group :test do
  gem 'factory_girl_rails'
  gem 'stripe-ruby-mock', '~> 1.10.1.2'
  gem 'faker'
  gem 'capybara'
  # gem 'guard-rspec'
  gem 'terminal-notifier-guard'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
end
