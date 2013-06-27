require 'spec_helper'

describe User do

=begin
context "creation" do 
    it "takes two parameters and returns a Favorite object" do
     user = Favorite.new
     fav.user_id = 1
     fav.internship_id = 1
     fav.should be_an_instance_of Favorite
    end
 end
=end

 context 'associations' do
   it { should have_many(:user_comments).dependent(:destroy) }
   it { should have_many(:favorites).dependent(:destroy) }
   it { should have_many(:notifications).dependent(:destroy) }
   it { should have_one(:internship) }
 end

 context 'validation' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:password) }
  end
end