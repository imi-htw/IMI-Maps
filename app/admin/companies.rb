ActiveAdmin.register Company do
    filter :internships_student_enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel"
    filter :name
    filter :city
    filter :country

	index do
    column :student do |n|
      link_to n.enrolment_number, "/admin/students/#{n.student_id}"
    end
    column :internships do |n|
      a = n.internships.map(&:id)
      str = ""
      a.each do |x|
        str += link_to x, "/admin/internships/#{x}"
      end
      str.html_safe
    end
    column :name
    column :number_employees
    column :industry
    column :website
    column :address
    column :main_language
    column :phone
    column :fax
    column :blacklisted
    default_actions
  end

	show do |company|
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
			    a = company.internships.map(&:id)
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
