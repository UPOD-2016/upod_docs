source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Elastic search GEMS <<_>>.:.
gem 'elasticsearch'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'searchkick'
gem 'gemoji-parser'
gem "devise"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
group :assets do
  gem 'coffee-rails'
end
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'active_record-acts_as'
gem 'acts_as_list'
gem 'annotate'
gem 'bootstrap-sass'
source 'https://rails-assets.org' do
  gem 'rails-assets-underscore'
end
gem 'js-routes'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Use Administrate for admin panel
gem "administrate", "~> 0.2.2"
gem "administrate-field-image"
gem "bourbon"

gem 'carrierwave'
gem "mini_magick"
gem 'quiet_assets'
gem 'jquery-turbolinks'
#Use YARD for documentation generation
gem "yard"


group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development do
	gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
  gem 'railroady'
end

group :development, :test do
  gem 'friendly_id', '~> 5.1.0'
  gem 'byebug'
  gem 'rspec-rails', '~> 3.4'
  gem 'factory_girl_rails'
  gem 'spring-commands-rspec'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end
