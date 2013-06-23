require 'spec_helper'

describe Favorite do
# the eq matcher uses == (object equivalence)
# the equal matcher uses equals? (object identity)
  context "creation" do 
    it "takes two parameters and returns a Favorite object" do
     fav = Favorite.new
     fav.user_id = 1
     fav.internship_id = 1
     fav.should be_an_instance_of Favorite
    end
  end


   context 'associations' do
     it {should belong_to(:user)}
     it {should belong_to(:internship)}
   end

  context 'validation' do
     it { should validate_presence_of(:user_id) }
     it { should validate_presence_of(:internship_id) }
   end
end
	