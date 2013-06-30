

namespace :data do
  desc "map old database data to new format"
  task :map_old_data => :environment do
    require 'database_parser'

    parser = DatabaseParser.new(
      student_file: "/home/Deployer/data/students_view.csv",
      internships_file: "/home/Deployer/data/internships_view.csv",
      companies_file: "/home/Deployer/data/companies_view.csv")
    parser.import_companies
    parser.import_students
    parser.import_internships
  end
end
