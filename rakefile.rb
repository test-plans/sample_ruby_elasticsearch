require 'ci/reporter/rake/minitest'
require 'rake/testtask'

Rake::TestTask.new do |t|
    t.pattern = "tests/test*.rb"
end

task :test => 'ci:setup:minitest'
