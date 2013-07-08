ActiveAdmin.register User do

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
end
