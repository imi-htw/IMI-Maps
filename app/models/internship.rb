class Internship < ActiveRecord::Base
  paginates_per 3
  attr_accessible :living_costs, :orientation_id, :salary_id, :working_hours, :programming_language_ids, :rating, :company_id, :user_id, :title, :recommend, :email_public, :semester_id, :description, :internship_report

  # validations
  validates :programming_language_ids, :presence => true, :allow_blank => false
  validates :salary_id, :presence => true, :numericality => true, :allow_blank => false
  validates :orientation_id, :presence => true, :numericality => true, :allow_blank => false
  validates :rating, :presence => true, :numericality => true, :allow_blank => false
  validates :company_id, :presence => true, :allow_blank => false
  validates :title, :presence => true, :allow_blank => false
  validates :working_hours, :presence => true, :allow_blank => false
  validates :living_costs, :presence => true, :allow_blank => false
  validates :description, :presence => true, :allow_blank => false
  validates :user_id, :presence => true
  validates :recommend, :presence => true
  validates :email_public, :presence => true
  validates :semester_id, :presence => true
  validates :internship_report, :presence => true


  # associations
  belongs_to :user
  belongs_to :company
  belongs_to :salary
  belongs_to :orientation
  belongs_to :semester

  has_and_belongs_to_many :programming_languages, :uniq => true
  has_many :user_comments, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  
  #attachments
  has_many :attachments, :as => :attachable

  mount_uploader :internship_report, InternshipReportUploader

  accepts_nested_attributes_for :attachments
end
