class Internship < ActiveRecord::Base
  attr_accessible :living_costs, :orientation, :salary_id, :working_hours, :programming_language_ids, :attachments_attributes, :rating, :company_id

  # validations
  validates :orientation, :presence => true
  validates :programming_language_ids, :presence => true
  validates :salary_id, :presence => true, :numericality => true
  validates :rating, :presence => true, :numericality => true
  validates :company_id, :presence => true


  # associations
  belongs_to :user
  belongs_to :company
  belongs_to :salary

  has_and_belongs_to_many :programming_languages
  has_many :comments, :dependent => :destroy

  #attachments
  has_many :attachments, :as => :attachable

  accepts_nested_attributes_for :attachments
end
