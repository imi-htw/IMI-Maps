ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    
     columns do
       column do
         panel "Recent Internships" do
           ul do
             InternshipRecord.last(10).reverse.map do |record|
               li link_to(record.internship.orientation.name+" Internship", admin_internship_record_path(record)) + " at " + link_to(record.internship.company.name, admin_company_path(record.internship.company)) 
             end
           end
         end
       end

       column do
         panel "Recent Students" do
           ul do
             Student.last(10).reverse.map do |student|
               li link_to(student.first_name+" "+student.last_name, admin_student_path(student))
             end
           end
         end
       end

     end
  end # content
end