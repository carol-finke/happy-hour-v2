source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem 'roo'
gem 'rubyXL'
gem "rails", "~> 7.1.3"
gem "sqlite3", "~> 1.4"
gem "puma", ">= 5.0"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 5.0'

# gem "aws-sdk-s3", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "tabulo"
  gem "web-console"
end

# Add Webpacker
gem 'webpacker', '~> 5.0'

# Add Bootstrap and jQuery
gem 'bootstrap', '~> 5.1.3'
gem 'jquery-rails'
