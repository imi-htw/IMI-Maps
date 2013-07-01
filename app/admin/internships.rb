ActiveAdmin.register Internship do
	filter :student_enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel", :input_html => { :class => 'chosen' }

	index do

    column :id
    column :title
    column :company_name do |x|
    	x.company.name
    end 
    column :student_enrolment_number do |x|
    	x.student.enrolment_number
    end
    column :working_hours
    column :living_costs
	  column :salary
	  column :tasks
	  column :orientation do |x|
	  	x.orientation.name
	  end
    default_actions

  end

end
