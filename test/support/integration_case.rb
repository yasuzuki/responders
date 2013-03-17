class ActiveSupport::IntegrationCase < ActiveSupport::TestCase
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  Capybara.app = Rails.application
  DatabaseCleaner.strategy = :truncation

  # Stop ActiveRecord from wrapping tests in transactions
  self.use_transactional_fixtures = false


  def teardown
    DatabaseCleaner.clean       # Truncate the database
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end