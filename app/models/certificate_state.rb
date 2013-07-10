class CertificateState < ActiveRecord::Base
  attr_accessible :name, :name_de

  has_many :internships
end
