require 'bundler/setup'
require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'SpreeWeightCalculator'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

app_rakefile_path = File.expand_path('../test/dummy/Rakefile', __FILE__)

if File.file?(app_rakefile_path)
  APP_RAKEFILE = app_rakefile_path

  load 'rails/tasks/engine.rake'
  load 'rails/tasks/statistics.rake'
end

Bundler::GemHelper.install_tasks

require 'spree/testing_support/extension_rake'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_weight_calculator'
  ENV['DUMMY_PATH'] = 'test/dummy'

  Rake::Task['extension:test_app'].invoke
end

# Default to running the test task.
task default: :test
