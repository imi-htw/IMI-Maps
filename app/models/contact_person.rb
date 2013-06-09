class ContactPerson < ActiveRecord::Base
  attr_accessible :company_id, :email, :first_name, :last_name, :phone

  validates :company_id, :presence => true
  validates :email, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :phone, :presence => true


  belongs_to :company 
end
