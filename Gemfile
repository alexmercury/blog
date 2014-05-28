source 'https://rubygems.org'

gem 'rails', '4.1.0'

gem 'pg'

group :assets do
  gem 'sprockets-rails', github: 'rails/sprockets-rails'
  gem 'sass-rails',   github: 'rails/sass-rails'
  gem 'coffee-rails', github: 'rails/coffee-rails'
  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
gem 'devise'
gem 'kaminari'
gem 'haml'
gem 'activeadmin', github: 'gregbell/active_admin'

gem 'rspec-rails', :group => [:test, :development]
group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'guard-rspec'
  gem 'shoulda-matchers'
end

#==================== Heroku fix
ruby '2.1.1'

group :production do
  gem 'rails_12factor'
end