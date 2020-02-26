module Parcel
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc 'Installs parceljs and creates files for configuration'

      def create_initializer_file
        initializer 'parcel.rb' do
          %(Parcel.setup do |config|
  config.source_entry_path = 'app/javascript/packs'
  config.public_out_path = 'parcels'
end
)
        end
      end

      def add_parcel_bundler
        rake 'parcel:install'
      end
    end
  end
end
