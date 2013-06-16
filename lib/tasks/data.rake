

namespace :data do
  desc "map old database data to new format"
  task :map_old_data => :environment do
    require 'database_parser'

    parser = DatabaseParser.new('/Users/schlubbi/Downloads/cake.yml')
    parser.run    
  end
end