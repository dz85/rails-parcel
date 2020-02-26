module Parcel
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'parcel/tasks.rake'
    end

    generators do
      require 'parcel/generators/install_generator'
    end

    config.parcel = ActiveSupport::OrderedOptions.new
    config.parcel.source_entry_path = 'app/javascript/packs'
    config.parcel.source_entry_types = ['**/*.js', '**/*.ts']
    config.parcel.public_out_path = 'parcels'
    config.parcel.cache_path = 'tmp/cache/parcel'
  end
end
