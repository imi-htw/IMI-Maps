class Company < ActiveRecord::Base
  attr_accessible :street, :city, :country, :zip, :main_language, :industry, :name, :number_employees, :website

  geocoded_by :address
  after_validation :geocode
  acts_as_gmappable :process_geocoding => false

  #associations
  has_many :internships
  has_many :contact_persons

	def address
		"#{self.street}, #{self.zip} #{self.city}, #{self.country}"
	end

  
  def find_company(search)
    companies = Company.all
    search.split(" ").each do |str| 
      companies = companies.where('country like ?', str)
      companies = companies.where('city like ?', str)
      companies = companies.where('zip like ?', str)
    end
    companies.uniq
  end
	
end
