FactoryGirl.define do
  factory :user do
    email "foo@bar.com"
    password "foofoo"
    publicmail "public_foo@bar.com"
    mailnotif true
    after(:build) do |user|
      user.student ||= FactoryGirl.build(:student, user: user)
    end
  end
end
