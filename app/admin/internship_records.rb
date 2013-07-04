ActiveAdmin.register InternshipRecord do

		filter :internship_student_enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel", :input_html => { :class => 'chosen' }
	  filter :internship_state
	  filter :payment_state
	  filter :registration_state
	  filter :contract_state
	  filter :report_state
	  filter :certificate_state
	  filter :reading_prof


	index do

		column :enrolment_number
    column :certificate_signed_by_internship_officer
    column :certificate_signed_by_prof 
    column :certificate_to_prof
    column :internship_state
	  column :payment_state
	  column :registration_state
	  column :contract_state
	  column :report_state
	  column :certificate_state
    default_actions

  end

end
