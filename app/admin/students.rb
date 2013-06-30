ActiveAdmin.register Student do
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