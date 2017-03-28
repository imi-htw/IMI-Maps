
namespace :db do
  desc "empty and re-seed database"
  task :reseed => :environment do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.start
    DatabaseCleaner.clean
    Rake::Task["db:seed"].execute
  end
end
