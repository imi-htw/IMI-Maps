class ChangeMatrikelNrToEnrolmentNumberForStudents < ActiveRecord::Migration
  def change
    rename_column :students, :matrikelNr, :enrolment_number
  end  
end
