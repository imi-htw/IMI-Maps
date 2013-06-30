ActiveAdmin.register InternshipRecord do

		filter :certificate_signed_by_internship_officer
    filter :certificate_signed_by_prof
    filter :certificate_to_prof
    filter :report_reading_prof
    filter :supervisor_email
    filter :supervisor_name
	  filter :internship_state
	  filter :payment_state
	  filter :registration_state
	  filter :contract_state
	  filter :report_state
	  filter :certificate_state

	index do

    column :certificate_signed_by_internship_officer
    column :certificate_signed_by_prof 
    column :certificate_to_prof
    column :report_reading_prof do |x|
    	x.reading_prof.try(:name)
    end
    column :supervisor_email
    column :supervisor_name
	  column :internship_state
	  #column :payment_state
	  column :registration_state
	  column :contract_state
	  column :report_state
	  #column :certificate_state
    default_actions

  end

end
