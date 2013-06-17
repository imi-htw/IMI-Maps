require 'spec_helper'

describe Favorite do
   context 'associations' do
     it {should belong_to(:user)}
     it {should belong_to(:internship)}
   end

  context 'validation' do
     it { should validate_presence_of(:user_id) }
     it { should validate_presence_of(:internship_id) }
   end
end
