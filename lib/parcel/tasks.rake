namespace :parcel do
  desc 'Install parceljs with yarn'
  task install: :environment do
    Parcel::Runner.install
  end

  desc 'Compiles assets using parceljs'
  task build: :environment do
    Parcel::Runner.build
  end

  desc 'Starts parceljs in development server mode'
  task serve: :environment do
    Parcel::Runner.serve
  end

  desc 'Starts parceljs in watch mode'
  task watch: :environment do
    Parcel::Runner.watch
  end

  desc 'Remove the parceljs compiled output directory'
  task clobber: [:environment] do
    Parcel::Runner.clobber
  end
end

if Rake::Task.task_defined?('assets:precompile')
  Rake::Task['assets:precompile'].enhance do
    Rake::Task['parcel:build'].invoke
  end
end

skip_parcel_clobber = %w[no false n f].include?(ENV['PARCEL_PRECOMPILE'])

unless skip_parcel_clobber
  if Rake::Task.task_defined?('assets:clobber')
    Rake::Task['assets:clobber'].enhance do
      Rake::Task['parcel:clobber'].invoke
    end
  end
end
