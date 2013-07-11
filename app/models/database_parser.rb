# encoding: UTF-8

require 'csv'

class DatabaseParser

  attr_reader :student_file, :internships_file, :companies_file

   COUNTRIES = {  
    nil => "not specified",
    "Neuseeland" => "New Zealand", 
    "Schweden" => "Sweden", 
    "Griechenland" => "Greece",
    "Katar" => "Qatar",
    "Vereinigte Arabische Emirate" => "United Arab Emirates",
    "Schweiz" => "Switzerland",
    "Ukraine" => "Ukraine",
    "Deutschland" => "Germany",
    "Australien" => "Australia",
    "Mongolei" => "Mongolia",
    "Tschechien" => "Czech Republic",
    "USA" => "United States",
    "England" => "United Kingdom",
    "USA, Virginia" => "United States",
    "France" => "France",
    "Österreich" => "Austria",
    "Belgien" => "Belgium",
    "Chile" => "Chile",
    "Spanien" => "Spain",
    "Niederlande" => "Netherlands",
    "Japan" => "Japan",
    "Thailand" => "Thailand",
    "Ägypten" => "Egypt",
    "China" => "China",
    "Luxemburg" => "Luxembourg",
    "Brasilien" => "Brazil",
    "Dänemark" => "Denmark",
    "Ungarn" => "Hungary",
    "Polen" => "Poland",
    "Spanien, Teneriffa" => "Spain",
    "Singapore" => "Singapore",
    "Ireland" => "Ireland",
    "Peru" => "Peru",
    "Malaysia" => "Malaysia",
    " Katar, Vereinigte Arabische Emirate" => "United Arab Emirates",
    "Italien" => "Italy",
    "Portugal" => "Portugal",
    "Sri Lanka" => "Sri Lanka",
    "Cuba" => "Cuba",
    "Kanada" => "Canada",
    "Israel" => "Israel",
    "Slowakai" => "Slovakia",
    "" => "not specified",
    "Switzerland" => "Switzerland",
    "Bulgarien" => "Bulgaria",
    "India" => "India",
    "Frankreich" => "France",
    "Trinidad, W.I." => "Trinidad and Tobago",
    "Russland" => "Russian Federation",
    "South Africa" => "South Africa",
    "Mexico" => "Mexico",
    "Czech Republic" => "Czech Republic",
    "Indonesia" => "Indonesia",
    "Lithuania" => "Lithuania",
    "Philippinen" => "Philippines",
    "Germany / Great Britain" => "United Kingdom",
    "Croatia" => "Croatia",
    "Belarus (White Russia)" => "Belarus",
    "Cyprus" => "Cyprus",
    "Island" => "Iceland",
    "D_nemark" => "Denmark",
    "Jordan" => "Jordan",
    "Argentina" => "Argentina",
    "Scotland" => "Scotland",
    "Afghanistan" => "Afghanistan",
    "Schottland" => "Scotland",
    "Keine Daten vorhanden" => "not specified",
    "Südafrika" => "South Africa",
    "Indien" => "India",
    "Canada" => "Canada",
    "Katar" => "Qatar",
    "Malta" => "Malta",
    "Türkei" => "Turkey",
    "Ecuador" => "Ecuador",
    "Dominikanische Republik" => "Dominican Republic",
    "Norwegen" => "Norway",
    "Tschechische Republik" => "Czech Republic" 
  }

  def initialize(options = {})
    @student_file = options[:student_file]
    @internships_file = options[:internships_file]
    @companies_file = options[:companies_file]
  end

  def import_students
    parse_file(student_file).each do |row|
      create_student row
    end
  end

  def import_internships
    parse_file(internships_file).each do |row|
      create_internship row
    end
  end

  def import_companies
    parse_file(companies_file).each do |row|
      create_company row
    end
  end

private

    def parse_file(file_name)
      CSV.read(File.open(file_name))
    end

    def create_student row
      Student.where(
       import_id: row[0],
       enrolment_number: row[1],
       first_name: row[3],
       last_name: row[2],
       email: row[6],
       birthday: row[4],
       birthplace: row[5]).first_or_create!
    end

    def create_company row
      Company.where(name: row[1], street: row[2], city: row[4],
          country: COUNTRIES[row[5]], zip: row[3], phone: row[6], blacklisted: row[8], import_id: row[0]).first_or_create!
    end

    def create_internship row
      semester = Semester.where('name like ?', "%#{row[1]}%").first_or_create!
      reading_prof = ReadingProf.where(name: row[15]).first unless row[15].nil?
      company = Company.where(import_id: row[19]).first
      student = Student.where(import_id: row[20]).first

      reading_prof_id = reading_prof.id if reading_prof
      binding.pry
      internship = Internship.where(
        company_id: company.id,
        student_id: student.id,
        semester_id: semester.id,
        start_date: row[4],
        end_date: row[5],
        operational_area: row[6],
        tasks: row[7],
        orientation_id: row[21],
        supervisor_name: row[2],
        supervisor_email: row[3],
        registration_state_id: prepare_state(row[9]),
        contract_state_id: prepare_state(row[10]),
        report_state_id: prepare_state(row[11]),
        certificate_state_id: (prepare_state(row[12]) if row[12].to_i != 0),
        payment_state_id: prepare_state(row[8]),
        internship_state_id: (prepare_state(row[13]) if row[13].to_i != 0),
        comment: row[14],
        reading_prof_id: reading_prof_id,
        certificate_to_prof: row[16],
        certificate_signed_by_prof: row[17],
        completed: false,
        certificate_signed_by_internship_officer: row[18]).first_or_create!

    end

    def prepare_state(state)
      state = state.to_i + 1 if state
    end


end
