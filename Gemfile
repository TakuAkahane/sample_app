# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Use Puma as the app server
gem 'puma', '~> 3.11'

#-------------- misc. ----------------------#
gem 'json'
gem 'meta-tags'
gem 'sitemap_generator'
gem 'mojimoji'
gem 'rake-remote_task'

#------------- template engine -------------#
gem 'erb2haml'
gem 'erb2slim' # erb2slim-0.0.1/lib/erb2slim.rb の２行目を require 'html2haml/html' に修正する必要あり
gem 'haml'
gem 'haml-rails'
gem 'haml2slim'
gem 'html2haml'
gem 'html2slim'
gem 'slim'
gem 'slim-rails'
gem 'will_paginate'
gem 'bootstrap-will_paginate', '~> 1.0'

# JS用のi18n
gem 'i18n-js'
# JS用のフラッシュメッセージ
gem 'toastr-rails'

# google map
gem "gmaps4rails"
gem "geocoder"

#------------- front-end -------------#
gem 'autosize'
gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
# gem 'jquery-turbolinks' # jQueryの挙動に影響を及ぼすため
gem 'sass-rails', '~> 5.0'
gem "sassc-rails" # precompile の高速化
# gem 'turbolinks', '~> 5' # jQueryの挙動に影響を及ぼすため
gem 'uglifier', '>= 1.3.0'
gem 'autoprefixer-rails'
gem 'sass'
gem 'gretel'
gem 'font-awesome-rails'
gem 'jquery-timepicker-rails'

gem 'data-confirm-modal'
gem 'rails-assets-tether', '~> 1.4.3', :source => 'https://rails-assets.org/'
# gem 'rails-assets-tether'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# group :development do
#   gem 'webpacker'
# end
# therubyracer は、JavaScript のエンジンである v8 を Ruby から使えるようにする gem
# 大量にメモリを消費するので node.js に切り替え
# gem 'therubyracer'
gem "wysiwyg-rails"

# ~~~~~~~~~~~~~~~~~ authentication ~~~~~~~~~~~~~~~~~#
gem 'devise'
gem 'devise-i18n'
gem 'omniauth', '~> 1.7.0'
gem 'omniauth-facebook', '>= 4.0.0'
gem 'omniauth-google-oauth2'
gem 'omniauth-linkedin-oauth2'

# session store
gem 'activerecord-session_store'

# soft delete
gem 'paranoia'

# Other
group :development do
  gem 'faker'
  gem 'pry-rails'
end
gem 'jp_prefecture'

#------------- PDF -------------#
gem 'wicked_pdf' # yum install -y ipa-gothic-fonts で日本語フォントを合わせてインストール
#gem 'wkhtmltopdf-binary-edge'
gem 'wkhtmltopdf-binary'

#------------- debug -------------#
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'meta_request'
  gem 'pry-alias'
  gem 'pry-byebug'
  gem 'stackprof'
end

#------------- programing tools -------------#
group :development, :test do
  # Static analysis tools
  gem 'rubocop', require: false
  gem 'rubycritic', require: false
  # profiler
  gem 'ruby-prof'
end

#------------- testing tools -------------#
group :development, :test do
  gem 'minitest'
  gem 'minitest-rails'
  gem 'test-unit' if RUBY_VERSION >= '2.2'

  gem 'database_cleaner'
  gem 'factory_bot_rails'

  gem 'rspec-core'
  gem 'rspec-expectations'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'rspec-support'
  gem 'bullet'
end





# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# therubyracerは、JavaScriptのエンジンであるv8をRubyから使えるようにするgem
# 大量にメモリを消費するため、node.jsをインストールする。
# gem 'therubyracer'
# 仮想環境上で下記コマンドを実行
# curl -sL https://rpm.nodesource.com/setup_8.x | bash -
# yum install -y nodejs gcc-c++ make

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
