source 'https://rubygems.org'
ruby '2.3.3'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'bourbon'
gem 'coffee-rails', '~> 4.2'
gem 'decanter'
gem 'faker'
gem 'figaro'
gem 'httparty'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'lp_token_auth', github: 'launchpadlab/lp_token_auth'
gem 'neat'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.1.4'
gem 'rails_util', github: 'launchpadlab/rails_util'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'token_master'
gem 'turbolinks', '~> 5'
gem 'twitter'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'webpacker-react'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers', '~> 3.1'
end
