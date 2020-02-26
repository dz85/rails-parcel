module Parcel
  class Runner
    def self.install
      exec_with_sym(:yarn, :add, 'parcel-bundler')
    end

    def self.watch
      exec_parcel(:watch)
    end

    def self.build
      exec_parcel(:build)
    end

    def self.serve
      exec_parcel(:serve)
    end

    def self.clobber
      clean(Configuration.out_path)
      clean(Configuration.cache_path)
    end

    private_class_method :new

    class << self
      private

        def exec_with_sym(*args)
          system(*args.map(&:to_s))
        end

        def exec_parcel(cmd)
          exec_with_sym(:yarn, :run, :parcel, cmd,
                        '--out-dir', Configuration.out_path, '--cache-dir', Configuration.cache_path,
                        *Configuration.entry_points)
        end

        def clean(directory)
          return unless directory.exist?

          directory.rmtree
          Parcel.logger.info "Removed #{directory}"
        end
    end
  end
end
