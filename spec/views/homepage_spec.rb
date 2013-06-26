require 'spec_helper'
require 'factory_girl'


FactoryGirl.define do
  factory :user do
    first_name "bla"
    last_name  "blubb"
    password "test"
    email  {|n| "foo#{n}@imimaps.com"}
   end
  end

describe "Homepage" do
  it "should ask for sign in" do
    visit root_path
    page.should have_content("Please Sign In")
  end
end


describe "Testing LogIn1" do
      it "login only with valid password", :js => true do
      	user4 =  FactoryGirl.build(:user)                                   
      	visit root_path
      	fill_in "email",  :with => user4.email
        fill_in "password",  :with => user4.password
        click_button "Log In"	
        expect { user4.save! }.to raise_error
        user4.errors[:password].should include("is too short (minimum is 5 characters)")
        user4.valid?.should be_false
        #flash[:alert].should =="Email or password is invalid"
        response.should render_template(:session)
        current_path.should == "/"
      end

      it "user is invalid when password less than 5 characters" do
       expect {user7 = User.create!(last_name: "Bell", first_name: "Lisa", password: "tes", email: "test@imimaps.com")}.to raise_error 
      end
   end 

=begin
describe "Testing Login2" do
      it "should allow user to login", :js => true do       
        @user6 = User.create!(last_name: "Bell", first_name: "Lisa", password: "testIT", email: "test@imimaps.com")
        @user6.save
        visit root_path
        fill_in "email",  :with => @user6.email
        fill_in "password",  :with => @user6.password
        click_button "Log In" 
        @user6.valid?.should be_true
        @current_user=@user6
        @current_user.nil?.should be_false
        #response.should render_template(:overview)
        visit overview_index_path("de")
        current_path.should == "/de/overview"
        page.should have_content("Search criteria")
        #page.find("My account").click
        #click_link "Account"
   end
   
end

describe "Testing Login3" do
      it "should allow user to login", :js => true do       
        visit root_path
        fill_in "email",  :with => "test@imimaps.com"
        fill_in "password",  :with => "test"
        click_button "Log In" 
        visit overview_index_path("de")
        page.should have_content("Search criteria")
       #response.should be_successful
        #should respond_with(:redirect)
        #current_path.should  redirect_to("overview#index")
        #response.should render_template(:overview)
        #uri = URI.parse(current_url)
        #{}"#{uri.path}?#{uri.query}".should == overview_index_path(:locale => 'en')
        #current_path.should == "/en/overview/"
        
   end
end

describe "Testing Login4" do
      it "should allow user to login", :js => true do       
        visit overview_index_path("de")      
        current_path.should == "/de/overview"
        page.should have_content("Search criteria")
       #response.should be_successful
        #should respond_with(:redirect)
        #current_path.should  redirect_to("overview#index")
        #response.should render_template(:overview)
        #uri = URI.parse(current_url)
        #{}"#{uri.path}?#{uri.query}".should == overview_index_path(:locale => 'en')
        #current_path.should == "/en/overview/"
        
   end
end
=end