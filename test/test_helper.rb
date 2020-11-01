ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :minitest
      with.library :rails
    end
  end

  def is_logged_in?
    session[:user_id].present?
  end

  def log_in_as(user)
    visit login_path
    within('form') do
        fill_in "Email", with: user.email
        fill_in "Password", with: 'secret'

        click_on 'Login'
      end
  end

  def login_as(user)
    post login_url, params:  {session: { email: user.email, password: 'secret' }}
  end
  # Add more helper methods to be used by all tests here...
end