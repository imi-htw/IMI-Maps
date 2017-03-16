FactoryGirl.define do
  factory :student do
    first_name "Foo"
    last_name "Bar"
    enrolment_number "enrollment number"
    birthday DateTime.now.to_date
    birthplace "birthplace"
    email "foo@bar.com"
    #user
    after(:build) do |student|
      student.user ||= FactoryGirl.build(:user, student: student)
    end
  end
end
