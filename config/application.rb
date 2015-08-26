require File.expand_path('../boot', __FILE__)

require 'neo4j/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# ENV['NEO4J_URL'] || raise('no NEO4J_URL provided')

module MoviesWithNeo4j
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
      g.template_engine :haml
    end

    config.neo4j.session_type = :server_db
    config.neo4j.session_type = Figaro.env.neo4j_type if Figaro.env.neo4j_type?
    config.neo4j.session_path = Figaro.env.neo4j_url if Figaro.env.neo4j_url?
    config.generators { |g| g.orm :neo4j }
  end
end
