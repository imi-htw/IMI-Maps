ActiveAdmin.register Orientation do
  filter :name

	index do
		column :name
		column :internships do |n|
      a = n.internships.map(&:id)
      str = ""
      a.each do |x|
        str += link_to x, "/admin/internships/#{x}"
      end
      str.html_safe
    end
    default_actions
	end

  show do |orientation|
      attributes_table do
        row :id
        row :name

        row :internships do |n|
          a = orientation.internships.map(&:id)
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
