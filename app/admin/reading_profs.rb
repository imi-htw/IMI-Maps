ActiveAdmin.register ReadingProf do
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

  show do |prof|
      attributes_table do
        row :id
        row :name

        row :internships do |n|
          a = prof.internships.map(&:id)
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
