# require 'bundler/setup'
require 'rails'
require 'rails-parcel'

module RSpecRails
  class Application < ::Rails::Application
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.before do
    source_entry_path = 'spec/fixtures/simple_js_project/packs'
    public_out_path = 'parcels'
    Parcel.setup do |c|
      c.source_entry_path = source_entry_path
      c.public_out_path = public_out_path
    end
  end
end
