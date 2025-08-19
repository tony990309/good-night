source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 8.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.6.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 6.6.1'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache and Active Job
gem 'solid_cache'
gem 'solid_queue'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.18.6', require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem 'thruster', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem 'rack-cors'

# Service Base
gem 'service_caller', '~> 1.2.2'
# Error Response
gem 'error_response', '~> 1.1.3'
# Serialize response
gem 'grape-entity', '~> 1.0.1'

# Pagination
gem 'kaminari', '~> 1.2.2'

# Generate postman doc after run rspec
gem 'rpdoc', '~> 0.2.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :windows]
  # RSpec for Rails-4+
  gem 'rspec-rails'
  # Factory Bot ♥ Rails
  gem 'factory_bot_rails'
  # Adds support for controller testing in Rails 5+
  gem 'rails-controller-testing'
  # pry debug tool
  gem 'pry', '~> 0.15.2'
  gem 'pry-byebug', '~> 3.11.0'
  # Database Cleaner for ActiveRecord, ensures a clean state for tests
  gem 'database_cleaner-active_record', '~> 2.2.2'
  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
