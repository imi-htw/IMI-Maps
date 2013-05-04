class InternshipSearch < ActiveRecord::Base
  attr_accessible :city, :country, :industry, :max_salary, :min_salary, :orientation, :rating
end
