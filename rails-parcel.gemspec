require_relative 'lib/parcel/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails-parcel'
  spec.version       = Parcel::VERSION
  spec.authors       = ['David Z.']
  spec.email         = ['geek@lzw.name']

  spec.summary       = 'Rails integration of parceljs'
  spec.description   = 'Rails integration of parceljs'
  spec.homepage      = 'http://github.com/bkbabydp/rails-parcel'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/bkbabydp/rails-parcel/blob/master/CHANGELOG.md'

  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rspec'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
