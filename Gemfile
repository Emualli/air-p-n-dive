source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '4.2.6'
gem 'puma'
gem 'pg'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'redis'

gem 'sass-rails'
gem 'jquery-rails'
gem 'uglifier'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'simple_form'
gem 'autoprefixer-rails'
gem 'devise' # Manages User login ('normal' connect)
gem 'omniauth-facebook' # Manages Facebook connect
gem 'bootstrap-datepicker-rails' # Datepicker boostrap for rails app
gem "cloudinary" #For image upload
gem "attachinary"
gem "jquery-fileupload-rails"
gem "coffee-rails"
# Add 'boostrap-dartetimepicker' on top of datepicker for hour picker management
#  --TODO-- refacto double gem inclusion
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'

gem 'geocoder' #Geolocaisation et Autocomplete
gem "gmaps4rails"

# Calendar for availability info
gem "simple_calendar", "~> 2.0"

# Add reddis for event handling
gem 'sidekiq'
gem 'sinatra'
gem 'sidekiq-failures'

source 'https://rails-assets.org' do
  gem "rails-assets-underscore"
end

group :development, :test do
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'


end

group :production do
  gem 'rails_12factor'
end
