class Location < ActiveRecord::Base
  attr_accessible :city, :country, :street, :zip

  validates :city, :presence => true
  validates :country, :presence => true
  validates :street, :presence => true
  validates :zip, :presence => true

  belongs_to :company
end
