# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'
gem 'bootsnap', require: false
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'geocoder'

group :development, :test do
  gem 'byebug'
  gem 'debug', '>= 1.0.0', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry', '~> 0.13.1'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :test do
  gem 'shoulda'
  gem 'shoulda-matchers'
end

group :development do
  gem 'annotate'
end
