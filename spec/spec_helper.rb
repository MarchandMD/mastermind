# frozen_string_literal: true

require 'bundler/setup'
require 'mastermind'
require_relative '../lib/mastermind'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.before { allow($stdout).to receive(:write) }
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
