source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
#gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
#gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'paperclip'

# Use jquery as the JavaScript library
gem 'jquery-rails'

#datepicker jquery
gem 'jquery-ui-rails'
#gem 'jquery_datepicker'

gem 'flexslider'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

gem "paperclip-dropbox"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'rails-erd', '~>1.1.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end 

group :development do
  gem 'awesome_print'
end

group :test, :development do
  # usamos SQLite para desarollo y testing
  gem 'sqlite3'
end

group :production do
  # gema requisito de Heroku
  gem 'rails_12factor'
  # usamos PostgresSQL para producción, por requisito de Heroku
  gem 'pg'
  # otro webserver mejor para producción
  gem 'unicorn'
end

# Use ActiveModel has_secure_password
#gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
