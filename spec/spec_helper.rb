# frozen_string_literal: true

require "stewardship"
require "rspec/its"
require "shoulda/matchers"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
  end
end

def read_fixture_file(filename)
  File.read(File.expand_path(File.join(__FILE__, "..", "fixtures", filename)))
end
