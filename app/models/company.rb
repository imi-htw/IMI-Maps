class Company < ActiveRecord::Base
  attr_accessible :address, :department, :industry, :name, :number_employees, :website

  geocoded_by :address
  after_validation :geocode
  acts_as_gmappable :process_geocoding => false

  # associations
  has_many :internships
end
