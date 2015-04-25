#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

# Loading more in this block will cause your tests to run faster. However,
# if you change any configuration or code from libraries loaded here, you'll
# need to restart spork for it take effect.

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rubygems'
require "minitest/autorun"
require 'rspec/rails'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/webkit/matchers'
require 'database_cleaner'
include Warden::Test::Helpers
Warden.test_mode!

Capybara.javascript_driver = :webkit


ActiveRecord::Migration.maintain_test_schema!

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of
  # your examples within a transaction, remove the following line or
  # assign false instead of true.
  config.use_transactional_fixtures = false
  
  config.include(MailerMacros)
  
  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true


  #Database cleaner stuff
  config.before :each do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
    else
      DatabaseCleaner.strategy = :truncation
    end
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
  config.include Capybara::DSL
  config.include(Capybara::Webkit::RspecMatchers, :type => :feature)
end
