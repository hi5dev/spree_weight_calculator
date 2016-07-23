$:.push File.expand_path('../lib', __FILE__)

require 'spree_weight_calculator/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "spree_weight_calculator"
  s.version = SpreeWeightCalculator::VERSION
  s.authors = ['Travis Haynes']
  s.email = ['travis@hi5dev.com']
  s.homepage = 'http://github.com/hi5dev/spree_weight_calculator'
  s.summary = 'Spree plugin for calculating shipping based on package weight.'
  s.license = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4.2.6'
  s.add_dependency 'spree_core', '>= 3.1.0'

  s.add_development_dependency 'sqlite3'
end
