# frozen_string_literal: true

require_relative 'lib/solidus_india/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_india'
  spec.version = SolidusIndia::VERSION
  spec.authors = ['piyushswain']
  spec.email = 'piyush.swain3@gmail.com'

  spec.summary = 'Starter for Solidus projects to be made in an Indian context.'
  spec.description = 'Starter for Solidus projects in an Indian context. Adds seeds and tax calculators for an Indian ecommerce store.'
  spec.homepage = 'https://github.com/solidusio-contrib/solidus_india#readme'
  spec.license = 'BSD-3-Clause'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/solidusio-contrib/solidus_india'
  spec.metadata['changelog_uri'] = 'https://github.com/solidusio-contrib/solidus_india/blob/master/CHANGELOG.md'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.7', '< 4')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'solidus_core', ['>= 2.2', '< 4']
  spec.add_dependency 'solidus_support', '~> 0.5'

  spec.add_development_dependency 'solidus_dev_support', '~> 2.5'
end
