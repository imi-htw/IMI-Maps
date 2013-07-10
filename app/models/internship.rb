class Internship < ActiveRecord::Base

  attr_accessible :living_costs, :orientation_id, :salary, :working_hours, :programming_language_ids, :internship_rating_id,
    :company_id, :user_id, :title, :recommend, :email_public, :semester_id, :description, :internship_report, :student_id, :start_date, :end_date, :operational_area, :tasks, :internship_state_id, :reading_prof_id, :payment_state_id, :registration_state_id, :contract_state_id, :report_state_id, :certificate_state_id, :certificate_signed_by_internship_officer, :certificate_signed_by_prof, :certificate_to_prof, :comment, :supervisor_email, :supervisor_name, :internship_rating_attributes, :completed



  #validates :programming_language_ids, :presence => true, :allow_blank => false
  #validates :salary, :presence => true, :numericality => true, :allow_blank => false
  #validates :orientation_id, :presence => true, :numericality => true, :allow_blank => false
  validates :company_id, :presence => true, :allow_blank => false
  #validates :title, :presence => true, :allow_blank => false
  #validates :working_hours, :presence => true, :allow_blank => false
  #validates :living_costs, :presence => true, :allow_blank => false
  #validates :description, :presence => true, :allow_blank => false
  #validates :user_id, :presence => true
  validates :semester_id, :presence => true

  belongs_to :user
  belongs_to :company
  belongs_to :orientation
  belongs_to :semester
  belongs_to :internship_rating
  belongs_to :student
  belongs_to :internship_state
  belongs_to :payment_state
  belongs_to :registration_state
  belongs_to :internship
  belongs_to :contract_state
  belongs_to :report_state
  belongs_to :certificate_state
  belongs_to :reading_prof


  has_and_belongs_to_many :programming_languages, :uniq => true
  has_many :user_comments, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :favorites, :dependent => :destroy

  has_many :attachments, :as => :attachable

  mount_uploader :internship_report, InternshipReportUploader

  accepts_nested_attributes_for :attachments, :internship_rating

  def editable?
    if self.report_state.try(:name) != "missing"  && self.student.try(:has_user?) && !self.completed
      true
    else
      false
    end
  end

  def enrolment_number
    student.enrolment_number
  end

end
