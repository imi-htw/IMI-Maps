require 'spec_helper'
require 'factory_girl'


FactoryGirl.define do
  factory :user do
    password "test"
    email  "foo@imimaps.com"
   end
  end

describe "Homepage" do
  it "should ask for sign in" do
    visit root_path
    page.should have_content("E-mail")
    page.should have_content("E-mail")
  end
end


describe "Testing LogIn1" do
      it "login data not valid because password too short" do
      	user4 =  FactoryGirl.build(:user)                                   
      	visit root_path
      	fill_in "email",  :with => user4.email
        fill_in "password",  :with => user4.password
        page.find('.signin-icon').click
        expect { user4.save! }.to raise_error
        user4.valid?.should be_false
        response.should render_template(:session)
        current_path.should == "/"
      end

      it "user is invalid when password less than 5 characters" do
       expect {user7 = User.create!(password: "tes", email: "test@imimaps.com")}.to raise_error 
      end
   end 


describe "Testing Login2" do
      it "should allow user to login" do       
        @user6 = User.create!( password: "testIT", email: "test@imimaps.com")
        @user6.save
        visit root_path
        fill_in "email",  :with => @user6.email
        fill_in "password",  :with => @user6.password
        page.find('.signin-icon').click
        @user6.valid?.should be_true
        @current_user=@user6
        @current_user.nil?.should be_false
        response.should render_template(:overview)
        visit overview_index_path("de")
        current_path.should == "/de/overview"
        page.should have_content("Rating")
   end
   
end

describe "Testing Login3" do
      it "should not allow user with fake login data to login" do       
        visit root_path
        fill_in "email",  :with => "test@imimaps.com"
        fill_in "password",  :with => "testFail"
        page.find('.signin-icon').click
        visit overview_index_path("de")
        response.should render_template(:session) 
   end
end

describe "Testing Login4" do
      it "should not allow access if not logged in" do       
        visit overview_index_path("de")      
        current_path.should == "/"
        
       #response.should be_successful
        #should respond_with(:redirect)
        #current_path.should  redirect_to("overview#index")
        #response.should render_template(:overview)
        #uri = URI.parse(current_url)
        #{}"#{uri.path}?#{uri.query}".should == overview_index_path(:locale => 'en')
        #current_path.should == "/en/overview/"
        
   end
end
