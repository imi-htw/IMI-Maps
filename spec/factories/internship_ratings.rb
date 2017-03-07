FactoryGirl.define do
  factory :internship_rating do
    tasks 3
    training_success 3
    atmosphere 3
    supervision 3
    appreciation 3

    factory :lowest_internship_rating do
      tasks 5
      training_success 5
      atmosphere 5
      supervision 5
      appreciation 5
    end

    factory :highest_internship_rating do
      tasks 5
      training_success 5
      atmosphere 5
      supervision 5
      appreciation 5
    end
  end
end
