require 'spec_helper'

describe Internship do

   context 'associations' do
     it {should belong_to(:user)}
     it {should belong_to(:company)}
     it { should have_many(:user_comments).dependent(:destroy) }
     it { should have_many(:favorites).dependent(:destroy) }
     it { should have_and_belong_to_many(:programming_languages) }
   end

 # context 'validation' do
  #   it { should validate_presence_of(:user_id) }
   #  it { should validate_presence_of(:semester_id) }
     #it { should validate_presence_of(:rating) }
   #end
end
