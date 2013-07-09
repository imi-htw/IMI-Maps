ActiveAdmin.register Student do
  filter :enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel"

  index do
    column :enrolment_number
    column :last_name
    column :first_name
    column :birthday
    column :birthplace
    column :email
    default_actions
  end


  show do |student|
      attributes_table do
        row :id
        row :enrolment_number
        row :last_name
        row :first_name
        row :birthday
        row :birthplace
        row :email

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
      active_admin_comments
    end
end
