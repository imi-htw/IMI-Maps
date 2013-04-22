class Internship < ActiveRecord::Base
  attr_accessible :living_costs, :orientation, :salary, :working_hours

  # associations
  belongs_to :user
  belongs_to :company
  has_and_belongs_to_many :programming_languages
end
