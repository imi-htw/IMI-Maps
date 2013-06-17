require 'spec_helper'

describe Internship do

   context 'associations' do
     it {should belong_to(:user)}
     it {should belong_to(:company)}
     it {should belong_to(:orientation)}
     it {should belong_to(:semester)}
     it {should belong_to(:internship_rating)}
   end

  context 'validation' do
     it { should validate_presence_of(:user_id) }
     it { should validate_presence_of(:semester_id) }
     it { should validate_presence_of(:rating) }
   end
end
