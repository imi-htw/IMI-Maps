ActiveAdmin.register Student do
  filter :enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel"
  filter :last_name
  filter :first_name
  filter :email

  index do
    column :enrolment_number do |n|
      link_to n.enrolment_number, "/admin/students/#{n.id}"
    end
    column :internships do |n|
      a = n.internships.map(&:id)
      str = ""
      a.each do |x|
        str += link_to x, "/admin/internships/#{x}"
      end
      str.html_safe
    end
    column :last_name
    column :first_name
    column :birthday
    column :birthplace
    column :email
    default_actions
  end


  show do |student|
      attributes_table do
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
			    end
			    str.html_safe
			  end
      end
      active_admin_comments
    end
end
