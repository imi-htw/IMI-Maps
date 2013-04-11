class Company < ActiveRecord::Base
  attr_accessible :address, :department, :industry, :name, :number_employees, :website
end
