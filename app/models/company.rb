class Company < ActiveRecord::Base
  include Rails.application.routes.url_helpers
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
	
end
