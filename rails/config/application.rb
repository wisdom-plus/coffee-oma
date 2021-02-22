require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Coffee
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.generators.active_record = true
    config.generators do |g|
      g.template_engine :slim
      g.integration_tool :rspec
      g.system_tests :rspec
      g.test_framework :rspec,
                       views_specs: false,
                       helper_specs: false,
                       controller_specs: false,
                       routing_specs: false,
                       model_specs: false
    end
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }
    config.active_job.queue_adapter = :delayed_job
  end
end
