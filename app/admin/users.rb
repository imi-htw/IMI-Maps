ActiveAdmin.register User do
	form do |f|
      f.inputs "Details" do
        f.input :first_name
        f.input :last_name
        f.input :email
        f.input :internship_authorization, :label => "internship authorization"
      end
      f.actions
    end

    show do |ad|
      attributes_table do
	  	row :id
        row :first_name
        row :last_name 
        row :email
        row :internship_authorization, :label => "internship authorization"
      end
      active_admin_comments
    end 

    index do
	  column :id
	  column :first_name
	  column :last_name
	  column :email
	  column :internship_authorization, :label => "internship authorization"
	  default_actions
	end

end
