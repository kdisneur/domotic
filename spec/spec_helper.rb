require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] = 'test'
  require File.expand_path "../../config/environment", __FILE__
  require 'rspec/rails'

  Dir[Rails.root.join "spec/support/**/*.rb"].each {|f| require f}

  require 'database_cleaner'

  RSpec.configure do |config|
    config.mock_with :rspec

    config.before(:each) do
      DatabaseCleaner.orm       = :active_record
      DatabaseCleaner.strategy  = :truncation
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  require File.expand_path "../../config/routes", __FILE__
end




