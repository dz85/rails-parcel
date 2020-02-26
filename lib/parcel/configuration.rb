module Parcel
  module Configuration
    def self.config
      ::Rails.configuration.parcel
    end

    def self.join_root(path)
      ::Rails.root.join(path)
    end

    def self.entry_points
      join_root(config.source_entry_path).glob(config.source_entry_types)
    end

    def self.out_path
      ::Rails.public_path.join(config.public_out_path)
    end

    def self.cache_path
      join_root(config.cache_path)
    end
  end
end
