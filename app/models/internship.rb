class Internship < ActiveRecord::Base
  attr_accessible :living_costs, :orientation_id, :salary_id, :working_hours, :programming_language_ids, :attachments_attributes, :rating, :company_id, :user_id, :title

  # validations
  validates :orientation, :presence => true
  validates :programming_language_ids, :presence => true
  validates :salary_id, :presence => true, :numericality => true
  validates :orientation_id, :presence => true, :numericality => true
  validates :rating, :presence => true, :numericality => true
  validates :company_id, :presence => true
  validates :title, :presence => true


  # associations
  belongs_to :user
  belongs_to :company
  belongs_to :salary
  belongs_to :orientation

  has_and_belongs_to_many :programming_languages
  has_many :user_comments, :dependent => :destroy
  has_many :answers, :dependent => :destroy

  #attachments
  has_many :attachments, :as => :attachable

  accepts_nested_attributes_for :attachments
end