require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.time_zone = 'Moscow'

    I18n.available_locales = %i[en ru]
    config.i18n.default_locale = :ru
    config.encoding = 'utf-8'
    config.eager_load_paths << "#{Rails.root}/lib/clients"

    Bundler.require(*Rails.groups)
    Dotenv::Railtie.load if %w[development test].include? ENV['RAILS_ENV']
    HOSTNAME = ENV['HOSTNAME']
  end
end
