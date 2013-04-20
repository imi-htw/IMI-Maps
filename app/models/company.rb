class Company < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :street, :city, :country, :zip, :main_language, :industry, :name, :number_employees, :website

  geocoded_by :address
  after_validation :geocode
  acts_as_gmappable :process_geocoding => false

  #associations
  has_many :internships

	def address
		"#{self.street}, #{self.zip} #{self.city}, #{self.country}"
	end
  
	def gmaps4rails_infowindow
    "<a href='/companies/#{id}' style='font-weight:bold'>#{self.name}</a><p>Industry: #{self.industry}</p><p>Employees: #{self.number_employees}</p><a href='#{self.website}'>#{self.website}</a>"
  end	
	
end
