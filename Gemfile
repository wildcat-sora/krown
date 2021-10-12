source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use mysql as the database for Active Record

# 2019.4.14 railsバージョン明示変更
# gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'mysql2', '0.5.2'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets

# 2019.4.14 railsバージョン明示変更
# gem 'sass-rails', '~> 5.0'
gem 'sass-rails', '5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# therubyracerを使用していたが、miniracer推奨のため変更（2020/6/11）
gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# 2019.4.14 gemファイルの追加        〜ここから
gem 'pry-rails'
gem 'compass-rails','3.1.0'
gem 'sprockets', '3.7.2'
gem 'devise'
gem 'kaminari'
gem 'haml-rails'
gem 'erb2haml'
gem 'font-awesome-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'rspec-rails'

# 再開発時にgemを導入
#gem 'therubyracer'

# 非同期処理導入
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'jquery-ui-rails'

# 画像添付対応
gem 'fastimage'
gem 'rmagick'

# 設定共通化-導入
gem 'config'

# モーダル出力機能追加
gem 'data-confirm-modal'

# バリデーション追記
gem 'jquery-validation-rails'

#gem 'autoprefixer-rails', '~> 8.0'

gem 'factory_bot_rails'

# 2019.4.14 gemファイルの追加        〜ここまで
group :production do
  gem 'unicorn', '5.4.1'
end


