class Location < ActiveRecord::Base
  attr_accessible :city, :country, :street, :zip

  belongs_to :company
end
