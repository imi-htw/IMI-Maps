# encoding: UTF-8

require 'yaml'

class DatabaseParser

  attr_reader :file_name

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

  def initialize(file_name)
    @file_name = file_name
  end

  def parse_file
    YAML::load(File.open(file_name))
  end

  def run
    parse_file.each do |entry|
      if entry.keys.include?("matrikelNo")
        #create_student entry
      elsif entry.keys.include?("country")
        #create_company entry
      elsif entry.keys.include?("semester")
        create_internship entry
      end
    end
  end

  def create_student db_entry
    Student.where(enrolment_number: db_entry["matrikelNo"],
     first_name: db_entry["forename"],
     last_name: db_entry["name"],
     email: db_entry["email"],
     birthday: db_entry["birthday"], 
     birthplace: db_entry["birthplace"]).first_or_create!
  end

  def create_company db_entry
    Company.where(name: db_entry["name"], street: db_entry["street"], city: db_entry['city'],
        country: COUNTRIES[db_entry['country']], zip: db_entry['zip'], phone: db_entry['phone'], blacklisted: db_entry["blackListed"], import_id: db_entry["id"]).first_or_create!
  end

  def create_internship db_entry
    semester = Semester.where(semester: db_entry['semester']).first_or_create! if db_entry["semester"]
    company = Company.where(import_id: db_entry["company_id"]).first
    student = Student.where(enrolment_number: db_entry["student_id"]).first

    internship = Internship.where(company_id: company.id, student_id: student.id, semester_id: (semester.id if semester)).first_or_create! if student
    
    InternshipRecord.where(internship_id: internship.id, supervisor_name: db_entry["supervisorName"], supervisor_email: db_entry["supervisorEmail"],
      registration_state_id: prepare_state(db_entry["registration"]), contract_state_id: prepare_state(db_entry["contract"]), report_state_id: prepare_state(db_entry["report"]), certificate_state_id: prepare_state(db_entry["certificate"]),
      internship_state_id: prepare_state(db_entry["state"]), comment: db_entry["stateComment"], report_reading_prof: db_entry["reportReadingProf"], certificate_to_prof: db_entry["certificateToProf"],
      certificate_signed_by_prof: db_entry["certificateSignedByProf"], certificate_signed_by_internship_officer: db_entry["certificateSignedByInternshipOfficer"]).first_or_create! if internship
  end

  def prepare_state(state)
    state = state + 1 if state
  end


end