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

		column :student do |n|
			link_to n.enrolment_number, "/admin/students/#{n.id}"
		end
		column :company
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

  show do |student|
      attributes_table do
        row :enrolment_number
        row :certificate_signed_by_internship_officer
    		row :certificate_signed_by_prof 
    		row :certificate_to_prof
    		row :internship_state
	  		row :payment_state
	  		row :registration_state
	  		row :contract_state
	  		row :report_state
	  		row :certificate_state
	  		row :reading_prof
	  		row :internship do |n|
	  			link_to n.internship.id, "/admin/internships/#{n.internship.id}" 
	  		end
	  		row :company
	  		row :student 

      end
      active_admin_comments
    end

end
