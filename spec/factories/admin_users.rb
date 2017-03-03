FactoryGirl.define do
  factory :admin_user do
    email "foo@bar.com"
    password "foofoofoo"
    password_confirmation "foofoofoo"
    remember_me true
  end
end
