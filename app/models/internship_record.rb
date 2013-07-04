class InternshipRecord < ActiveRecord::Base
  attr_accessible :internship_state_id, :reading_prof_id, :internship_id, :payment_state_id, :registration_state_id, :contract_state_id, :report_state_id, :certificate_state_id, :certificate_signed_by_internship_officer, :certificate_signed_by_prof, :certificate_to_prof, :comment, :supervisor_email, :supervisor_name

  belongs_to :internship_state
  belongs_to :payment_state
  belongs_to :registration_state
  belongs_to :internship
  belongs_to :contract_state
  belongs_to :report_state
  belongs_to :certificate_state
  belongs_to :reading_prof

  def enrolment_number
  	internship.student.enrolment_number
  end

  def company
    internship.company
  end

  def student
    internship.student
  end

end
