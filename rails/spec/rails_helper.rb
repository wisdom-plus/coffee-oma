# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'codecov'
require 'simplecov'
SimpleCov.start 'rails'
if ENV['CI']
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'capybara/rspec'
require 'test_prof/recipes/rspec/let_it_be'
require 'test_prof/recipes/logging'
require 'test_prof/recipes/rspec/factory_default'
require 'view_component/test_helpers'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }
# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Capybara.register_driver :remote_chrome do |app|
  url = 'http://chrome:4444/wd/hub'
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => {
      'args' => [
        'no-sandbox',
        'headless',
        'disable-gpu',
        'disable-dev-shm-usage',
        'window-size=1024,640'
      ]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :remote, url: url, capabilities: caps)
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{Rails.root}/spec/fixtures"
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, js: true, type: :system) do
    driven_by :remote_chrome
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 4444
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end

  config.after(:all) do
    if Rails.env.test?
      FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads/#{Rails.env}/"])
    end
  end
  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Selenium::WebDriver.logger.level = :warn
  Selenium::WebDriver.logger.ignore(:caps_browsers)

  config.include FactoryBot::Syntax::Methods
  config.include Warden::Test::Helpers
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include LoginHelper
  config.include ActionTextHelper, type: :system
  config.include ActiveJob::TestHelper
  config.include ActiveSupport::Testing::TimeHelpers
  config.include ViewComponent::TestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
  config.include Devise::Test::ControllerHelpers, type: :component
  config.include Requests::JsonHelpers, type: :request
  config.include Requests::AuthorizationHelpers, type: :request

  config.before(:each, type: :component) do
    @request = controller.request
  end
end
