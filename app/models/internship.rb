class Internship < ActiveRecord::Base
  attr_accessible :living_costs, :orientation, :programming_language, :salary, :working_hours

  # associations
  belongs_to :user
  belongs_to :company
end
