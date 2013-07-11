class Internship < ActiveRecord::Base

  attr_accessible :attachments_attributes, :living_costs, :orientation_id, :salary, :working_hours, :programming_language_ids, :internship_rating_id,
    :company_id, :user_id, :title, :recommend, :email_public, :semester_id, :description, :internship_report, :student_id, :start_date, :end_date, :operational_area, :tasks, :internship_state_id, :reading_prof_id, :payment_state_id, :registration_state_id, :contract_state_id, :report_state_id, :certificate_state_id, :certificate_signed_by_internship_officer, :certificate_signed_by_prof, :certificate_to_prof, :comment, :supervisor_email, :supervisor_name, :internship_rating_attributes, :completed

#  validates :company_id, :presence => true
#  validates :semester_id, :presence => true
#  validates :student_id, :presence => true
#  validates :registration_state_id, :presence => true
#  validates :payment_state_id, :presence => true
#  validates :contract_state_id, :presence => true
#  validates :report_state_id, :presence => true
#  validates :certificate_state_id, :presence => true
#  validates :reading_prof_id, :presence => true
#  validates :certificate_to_prof, :presence => true
#  validates :certificate_signed_by_prof, :presence => true
#  validates :certificate_signed_by_internship_officer, :presence => true
#  validates :internship_state, :presence => true
     

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
  has_many :favorites, :dependent => :destroy

  has_many :attachments, :as => :attachable, :dependent => :destroy

  mount_uploader :internship_report, InternshipReportUploader

  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :internship_rating

  def rating 
    internship_rating.total_rating
  end

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
