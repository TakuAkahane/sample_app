# encoding: utf-8
# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TokyoRealEstateCommunity
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # MySQLに登録される時間を世界標準時から日本標準時に変更。
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators.system_tests = nil
    config.generators do |g|
      # レイアウト、テンプレートエンジン系の設定
      g.javascripts false
      g.stylesheets false
      g.template_engine :slim
      g.test_framework :rspec, view_specs: false, fixture: true
    end

    # I18nJs
    config.middleware.use I18n::JS::Middleware
  end
end
