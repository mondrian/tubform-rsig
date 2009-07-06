$LOAD_PATH.unshift(RAILS_ROOT + '/vendor/plugins/cucumber/lib') if File.directory?(RAILS_ROOT + '/vendor/plugins/cucumber/lib')

begin
  require 'cucumber/rake/task'

  task :features_default do
    sh "rake db:test:prepare"
    sh "rake RAILS_ENV=test db:migrate:reset"
    sh "cucumber"
  end

  task :trabalhando do
    sh "rake db:test:prepare"
    sh "rake RAILS_ENV=test db:migrate:reset"
    sh "cucumber -p trabalhando"
  end
  task  :incompleta do
    sh "rake db:test:prepare"
    sh "rake RAILS_ENV=test db:migrate:reset"
    sh "cucumber -p incompleta"
  end

  task :trabalhando_selenium do
    sh "rake db:test:prepare"
    sh "rake RAILS_ENV=test db:migrate:reset"
    sh "cucumber -p trabalhando_selenium"
  end

  task :incompleta do
    sh "rake db:test:prepare"
    sh "rake RAILS_ENV=test db:migrate:reset"
    sh "cucumber -p incompleta"
  end

  task :features_selenium do
    sh "rake db:test:prepare"
    sh "rake RAILS_ENV=test db:migrate"
    sh "cucumber -p selenium"
  end

  task :features do
    Rake::Task["features_default"].invoke
    Rake::Task["features_selenium"].invoke
  end

rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end