

namespace :data do
  desc "map old database data to new format"
  task :map_old_data => :environment do
    require 'database_parser'

    parser = DatabaseParser.new(
      student_file: "/home/basti/students_view.csv",
      internships_file: "/home/basti/internships_view.csv",
      companies_file: "/home/basti/companies_view.csv")
    parser.import_companies
    parser.import_students
    parser.import_internships
  end
end
