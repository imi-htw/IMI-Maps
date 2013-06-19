class Company < ActiveRecord::Base
  attr_accessible :street, :city, :country, :zip, :main_language, :industry, :name, :number_employees, :website, :phone, :blacklisted, :fax

  # validations
  validates :city, :presence => true, :allow_blank => false
  validates :country, :presence => true, :allow_blank => false
  validates :main_language, :presence => true, :allow_blank => false
  validates :industry, :presence => true, :allow_blank => false
  validates :name, :presence => true, :allow_blank => false
  validates :number_employees, :presence => true, :allow_blank => false
  validates :website, :presence => true, :allow_blank => false




  geocoded_by :address
  after_validation :geocode
  acts_as_gmappable :process_geocoding => false

  #associations
  has_many :internships
  has_many :contact_persons
  has_many :locations

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
