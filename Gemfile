# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

gem 'puma', '>= 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'bootsnap', require: false

gem 'sentry-rails'
gem 'sentry-ruby'

gem 'devise', '~> 4.9', '>= 4.9.3'

gem 'slim-rails', '~> 3.6', '>= 3.6.3'

gem 'simple_form', '~> 5.3'

gem 'ancestry'

group :development, :test do
  # gem 'debug', platforms: %i[mri windows]
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker', '~> 3.2', '>= 3.2.2'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'capybara'
  gem 'minitest-power_assert'
  gem 'rubocop-rails', '~> 2.23'
  gem 'selenium-webdriver'
  gem 'slim_lint', '~> 0.24.0'
end
