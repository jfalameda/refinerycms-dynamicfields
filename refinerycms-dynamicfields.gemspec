# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-dynamicfields'
  s.authors           = 'José Fernández Alameda'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Dynamicfields extension for Refinery CMS'
  s.date              = '2013-07-20'
  s.summary           = 'Dynamicfields extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 3.0.0'
  s.add_dependency             'nested_form'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.0'
end
