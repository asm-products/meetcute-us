require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(:default, Rails.env)

module SiteService
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => true,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => true

      g.fixture_replacesment :factory_girl, :dir => "spec/factories"
      
      g.stylesheets = false
      g.javascripts = false
    end

    config.compass.require "susy"
    config.compass.require "compass-normalize"
    config.compass.images_dir = "/app/assets/images"
  end
end
