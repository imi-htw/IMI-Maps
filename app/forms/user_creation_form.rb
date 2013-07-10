class UserCreationForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :given_enrolment_number, :existing_student, :student

  def initialize(enrolment_number)
    @given_enrolment_number = enrolment_number
    @existing_student = Student.where(:enrolment_number => enrolment_number).first
    @student = new_or_existing
  end

  def persisted?
    false
  end

  validates :email, :presence => true
  validates :password, :presence => true, length: { minimum: 5 }
  validates :password_confirmation, :presence => true



  delegate :email, :password, :password_confirmation, :publicmail, :mailnotif,  to: :user

  delegate :first_name, :enrolment_number, :last_name, :birthday, :birthplace, to: :student

  def user
    @user ||= User.new
  end

  def new_or_existing
    if existing_student
      existing_student
    else
      Student.new(enrolment_number: given_enrolment_number)
    end
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
