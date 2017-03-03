FactoryGirl.define do
  factory :user do
    email "foo@bar.com"
    password "foofoo"
    publicmail "public_foo@bar.com"
    mailnotif true
    after(:build) do |user|
      user.student = FactoryGirl.create(:student, user: user)
    end
  end
end
