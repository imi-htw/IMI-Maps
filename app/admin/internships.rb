ActiveAdmin.register Internship do
	filter :student_enrolment_number, :as => :select, :collection => proc { Student.all.map(&:enrolment_number).uniq }, :label => "Matrikel", :input_html => { :class => 'chosen' }

	index do

    column :id
    column :title
    column :company_name do |x|
    	x.company.name
    end 
    column :student_enrolment_number do |x|
    	x.student.enrolment_number
    end
    column :working_hours
    column :living_costs
	  column :salary
	  column :tasks
	  column :orientation do |x|
	  	x.orientation.try(:name)
	  end
    default_actions

  end


  form do |f|
    f.inputs "Student" do 
      f.input :student_id, as: :select, collection: Student.order(:last_name).collect { |s| ["#{s.enrolment_number}, #{s.last_name}, #{s.first_name}", s.id] }
    end
    f.inputs "Company" do 
      f.input :company_id, as: :select, collection: Company.order(:name).collect { |c| ["#{c.name}, #{c.city}, #{c.country}", c.id] }
    end
    f.inputs "Internship" do
      f.input :start_date
      f.input :end_date
      f.input :operational_area
      f.input :tasks
      f.input :supervisor_name
      f.input :supervisor_email
    end
    f.inputs "Administration" do
      f.input :semester_id, label: "Semester", as: :select, collection: Semester.order(:semester).collect { |s| [s.semester, s.id] }
      f.input :registration_state_id, label: "Registration", as: :select, collection: RegistrationState.order(:name).collect { |rs| [rs.name, rs.id] }
      f.input :payment_state_id, label: "Payment", as: :select, collection: PaymentState.order(:name).collect { |ps| [ps.name, ps.id] }
      f.input :contract_state_id, label: "Contract", as: :select, collection: ContractState.order(:name).collect { |cs| [cs.name, cs.id] }
      f.input :report_state_id, label: "Report", as: :select, collection: ReportState.order(:name).collect { |rs| [rs.name, rs.id] }
      f.input :certificate_state_id, label: "Certificate", as: :select, collection: CertificateState.order(:name).collect { |cs| [cs.name, cs.id] }
      f.input :reading_prof_id, label: "Certficate reading prof", :as => :select, :collection => ReadingProf.order(:name).collect { |p| [p.name, p.id] }
      f.input :certificate_to_prof
      f.input :certificate_signed_by_prof
      f.input :certificate_signed_by_internship_officer
      f.input :internship_state, as: :select, collection: InternshipState.order(:name).collect { |is| [is.name, is.id] }
      f.input :comment
      f.actions

    end


  end

end
