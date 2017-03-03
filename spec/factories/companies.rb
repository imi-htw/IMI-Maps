FactoryGirl.define do
  factory :company do
    name "company name"
    number_employees 2
    industry "company industry"
    website "company website"
    latitude 128.0
    longitude 128.0
    city "company city"
    country "company country"
    street "company street"
    zip "company zip"
    main_language "company main language"
    phone "company phone"
    fax "company fax"
    blacklisted false
    import_id 1
  end
end
