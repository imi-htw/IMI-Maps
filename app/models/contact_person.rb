class ContactPerson < ActiveRecord::Base
  attr_accessible :company_id, :email, :first_name, :last_name, :phone

  belongs_to :company 
end
