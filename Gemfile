source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'authlogic'
gem 'nokogiri'
gem 'paperclip'
gem 'rspec-rails'
gem 'heroku'
gem 'haml-rails'
gem 'jquery-rails'
gem 'execjs'
gem 'therubyracer'
gem 'pg'
gem 'date_validator'
gem 'factory_girl_rails'



group :production do
  gem 'aws-sdk'
end

group :test do
  gem 'email_spec'
  gem 'sqlite3'
  gem 'launchy'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-screenshot' #, :git => "git://github.com/jackdesert/capybara-screenshot.git"
  gem 'database_cleaner'
  gem 'minitest'
  # Pretty printed test output
  gem 'turn', :require => false
end

group :development, :test do
  gem 'pry'
  gem 'pry_debug'
  gem 'ruby-debug19', :require => 'ruby-debug'
  
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

