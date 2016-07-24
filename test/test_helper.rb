# Disable Ruby warnings.
$VERBOSE=nil

# Abort if the test app hasn't been generated yet.
unless File.directory?(File.expand_path('../dummy', __FILE__))
  $stderr.puts 'You need to run `rake test_app` before you can run the tests.'

  exit(2)
end

# Configure Rails Environment
ENV['RAILS_ENV'] ||= 'test'

# Load the Spree dummy app.
require File.expand_path('../dummy/config/environment.rb',  __FILE__)

# Configure ActiveSupport for testing.
ActiveSupport.test_order = :random

# Turn off deprecation warnings for ActiveSupport.
ActiveSupport::Deprecation.silenced = true

# Add the dummy app's migrations.
ActiveRecord::Migrator.migrations_paths = [
  File.expand_path('../dummy/db/migrate', __FILE__)
]

# Load the test dependencies.
require 'rails/test_help'
require 'byebug'

# Filter out Minitest backtrace.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f }

# Load fixtures from the engine.
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path('../fixtures', __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.fixtures :all
end
