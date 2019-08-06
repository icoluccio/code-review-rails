source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Simple, multi-client and secure token-based authentication for Rails.
gem 'devise_token_auth', '1.1.0'
# ActiveModelSerializers allows you to generate your JSON in an object-oriented.
gem 'active_model_serializers', '~> 0.10.10'
# WorPaginate simplifies pagination, for controller methods, standardizing JSON output for APIs.
gem 'wor-paginate', '~> 0.1.4'
# Object oriented authorization for Rails applications
gem 'pundit', '~> 2.1'
# Makes consuming restful web services dead easy.
gem 'httparty', '~> 0.17.0'
# Simple, efficient background processing for Ruby.
gem 'sidekiq', '5.2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Loads environment variables from `.env`.
gem 'dotenv', '~> 2.7', '>= 2.7.5'
# Job scheduling extension for Sidekiq that adds support for queueing jobs in a recurring way.
gem 'sidekiq-scheduler', '~> 3.0'
# RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data.
gem 'rails_admin', '~> 2.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Automatic Rails code style checking tool.
  gem 'rubocop-rails', '~> 2.3.0'
  # Static code analyzer and code formatter.
  gem 'rubocop', '~> 0.74.0'
  # Testing framework to Ruby on Rails as a drop-in alternative to its default testing framework
  gem 'rspec-rails', '~> 3.8'
  # Gem library that generates fake data.
  gem 'faker', '~> 2.1', '>= 2.1.2'
  # A library for setting up Ruby objects as test data.
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # Database Cleaner is a set of gems containing strategies for cleaning your database in Ruby.
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  # Simple one-liner tests for common Rails functionality
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  # WebMock allows stubbing HTTP requests and setting expectations on HTTP requests.
  gem 'webmock', '~> 3.7', '>= 3.7.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
