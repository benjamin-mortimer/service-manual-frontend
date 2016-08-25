source 'https://rubygems.org'

ruby File.read(".ruby-version").strip

gem 'airbrake', '4.0'
gem 'govuk_frontend_toolkit'
gem 'govuk_template'
gem 'govuk_elements_rails', '~> 2.0.0'
gem 'logstasher', '0.6.1'
gem 'plek', '1.11'
gem 'rails', '4.2.7.1'
gem 'sass-rails', '~> 5.0.4'
# gem 'slimmer', '9.1.0'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn', '4.8'
gem 'rails-i18n', '>= 4.0.4'
gem 'rails_translation_manager', '~> 0.0.2'

if ENV['API_DEV']
  gem 'gds-api-adapters', path: '../gds-api-adapters'
else
  gem 'gds-api-adapters', '27.0.0'
end

group :development, :test do
  gem "jasmine-rails"
  gem 'govuk-lint'
  gem 'phantomjs', '~> 1.9.7'
  gem 'wraith', '~> 3.1'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'webmock', '~> 1.18.0', require: false
  gem 'govuk-content-schema-test-helpers', '1.1.0'
  gem 'pry-byebug'
end
