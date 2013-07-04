ActiveAdmin.register Company do
    filter :internships_student_enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel", :input_html => { :class => 'chosen' }
    filter :name
    filter :city
    filter :country

	index do
    column :student do |n|
      link_to n.enrolment_number, "/admin/students/#{n.id}"
    end
    column :name
    column :number_employees
    column :industry
    column :website
    column :city
    column :country
    column :street
    column :zip
    column :main_language
    column :phone
    column :fax
    column :blacklisted
    default_actions
  end

	show do |student|
      attributes_table do
      	row :id
      	row :name
      	row :number_employees
      	row :industry
      	row :website
      	row :city
      	row :country
      	row :street
      	row :zip
      	row :main_language
      	row :phone
      	row :fax
      	row :blacklisted
  			row :internships do |n|
			    a = student.internships.map(&:id)
			    str = ""
			    a.each do |x|
			   		str += link_to x, "/admin/internships/#{x}"
			   		str += "<br/>"
			    end
			    str.html_safe
			  end
			end
		end
end
