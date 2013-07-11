

namespace :data do
  desc "map old database data to new format"
  task :map_old_data => :environment do
    require 'database_parser'

    parser = DatabaseParser.new(
      student_file: "/home/deployer/data/students_view.csv",
      internships_file: "/home/deployer/data/internships_view.csv",
      companies_file: "/home/deployer/data/companies_view.csv")
    parser.import_companies
    parser.import_students
    parser.import_internships
  end

  desc "geocode all companies"
  task :geocode_companies => :environment do 
    Company.find_each do |company|
      result = company.geocode
      if result.present?
        puts "RESULT: #{result}"
        company.update_attributes(latitude: result[0], longitude: result[1])
      end
    end
  end
end
