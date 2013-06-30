class UserCreationForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :enrolment_number, :existing_student

  def initialize(enrolment_number)
   @enrolment_number = enrolment_number
   @existing_student = Student.where(:enrolment_number => enrolment_number).first
  end

  def persisted?
    false
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "User")
  end

  delegate :email, :password, :password_confirmation, :publicmail, :mailnotif,  to: :user

  delegate :first_name, :enrolment_number, :last_name, to: :student

  def user
    @user ||= User.new
  end

  def student
    @student ||= existing_student ? existing_student : Student.new(enrolment_number: enrolment_number)
  end

  def submit(params)
    student.attributes = params.slice(:first_name, :last_name, :enrolment_number)
    student.email = params.slice(:student_email)
    user.attributes = params.slice(:email, :password, :password_confirmation, :publicmail, :mailnotif)
    user.student_id = student.id
    if valid?
      user.save!
      student.save! unless existing_student.present?
      true
    else
      false
    end
  end

  def student_email
    student.email
  end

  def id
    user.id
  end

  def editable?
    existing_student.present?
  end








end
