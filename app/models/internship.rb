class Internship < ActiveRecord::Base
  attr_accessible :living_costs, :orientation_id, :salary_id, :working_hours, :programming_language_ids, :attachments_attributes, :rating, :company_id, :user_id, :title, :recommend, :email_public, :semester, :description

  # validations
  validates :orientation, :presence => true, :allow_blank => false
  validates :programming_language_ids, :presence => true, :allow_blank => false
  validates :salary_id, :presence => true, :numericality => true, :allow_blank => false
  validates :orientation_id, :presence => true, :numericality => true, :allow_blank => false
  validates :rating, :presence => true, :numericality => true, :allow_blank => false
  validates :company_id, :presence => true, :allow_blank => false
  validates :title, :presence => true, :allow_blank => false


  # associations
  belongs_to :user
  belongs_to :company
  belongs_to :salary
  belongs_to :orientation

  has_and_belongs_to_many :programming_languages, :uniq => true
  has_many :user_comments, :dependent => :destroy
  has_many :answers, :dependent => :destroy

  #attachments
  has_many :attachments, :as => :attachable

  accepts_nested_attributes_for :attachments
end
