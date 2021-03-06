source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'sass-rails',   '~> 3.2'
gem 'bootstrap-sass', '~> 3.1'
gem 'carrierwave', '0.8.0'
gem 'mini_magick', '3.5.0'
gem 'rails-settings-cached'
gem 'scrypt'
gem 'authlogic'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'
  gem 'childprocess', '0.3.9'
  gem 'spork', '0.9.2'
  gem 'faker', '1.2.0'
end

group :development do
  gem 'annotate', '2.5.0'
end

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '4.1.0'

  # Mac OS X
  # gem 'rb-fsevent', '0.9.1', :require => false
  # gem 'growl', '1.0.3'

  # Linux
  # gem 'rb-inotify', '0.8.8'
  # gem 'libnotify', '0.5.9'

  # Windows
  gem 'rb-fchange', '0.0.5'
  gem 'rb-notifu', '0.0.4'
  gem 'win32console', '1.3.0'
  require 'rbconfig'
  gem 'wdm', '>= 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
end

group :production do
  gem 'pg', '0.12.2'
end
