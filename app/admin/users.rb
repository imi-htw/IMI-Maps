ActiveAdmin.register User do
  filter :student_enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel"

  index do
    column :student do |n|
      link_to n.enrolment_number, "/admin/students/#{n.student_id}"
    end
    column :internship_authorization
    column :publicmail
    column :mailnotif
    column :email
    default_actions
  end

  form do |f|
    f.inputs "User" do
    f.input :student_id, as: :select, collection: Student.order(:enrolment_number).collect { |s| ["#{s.enrolment_number} #{s.last_name} #{s.first_name}", s.id] }

    f.input :publicmail
    f.input :mailnotif
    f.input :email
    f.input :password
    f.input :password_confirmation
    end
    f.buttons

  end

  show do |user|
    attributes_table do
      row :student do |n|
        link_to n.enrolment_number, "/admin/students/#{n.id}"
      end
      row :internship_authorization
      row :publicmail
      row :mailnotif
      row :email    
    end
    active_admin_comments
  end

end
