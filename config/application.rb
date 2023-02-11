require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hackernews
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Kolkata"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.test_framework(
        :rspec,
        fixtures: true,
        routing_specs: false,
        helper_scpecs: false,
      )
      g.fixture_replacement :factory_bot
    end
  end
end
