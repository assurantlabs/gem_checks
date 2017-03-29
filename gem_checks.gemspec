$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'gem_checks/version'

Gem::Specification.new do |gem|
  gem.name        = 'gem_checks'
  gem.version     = Version::VERSION
  gem.author      = 'Jacob Chae'
  gem.email       = 'jacob.chae@mobiledefense.com'
  gem.homepage    = 'https://github.com/mobiledefense/gem_checks'
  gem.description = 'Validate your Gemfile.lock against Gemnasium.'
  gem.summary     = 'Validate your Gemfile.lock against Gemnasium.'
  gem.license     = 'Apache'

  gem.test_files  = Dir['spec/*_spec.rb']
  gem.files       = Dir['lib/**/*.rb']

  gem.required_ruby_version = '>= 2.1.0'

  gem.add_development_dependency 'rspec', '~> 3.4', '>= 3.4.0'
  gem.add_development_dependency 'rake', '~> 11.1', '>= 11.1.0'
  gem.add_development_dependency 'codeclimate-test-reporter'
  gem.add_runtime_dependency 'nokogiri', '~> 1.7.1', '>= 1.7.1'

  gem.executables = ['gem_checks']
end
