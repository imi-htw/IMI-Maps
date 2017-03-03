#require 'spec_helper'

#describe "Testing LogIn1" do
     ##include Capybara::DSL
      ##it "login data not valid because password too short. Render Session" do
        ##user4 =  FactoryGirl.build(:user)
        ##visit root_path
        ##fill_in "email",  :with => user4.email
        ##fill_in "password",  :with => user4.password
        ##page.find('.signin-icon').click
        ##expect { user4.save! }.to raise_error
        ##user4.valid?.should be false
        ##response.should render_template(:session)
        ##current_path.should == "/"
      ##end

      ##it "user is invalid when password less than 5 characters" do
       ##expect {user7 = User.create!(password: "tes", email: "test@imimaps.com", student_id: 1)}.to raise_error
      ##end

      #it "should allow user to login with valid data and redirect to overview" do
        #@user6 = User.create!( password: "testIT", email: "test@imimaps.com", student_id: 1)
        #@user6.save
        #visit root_path
        #fill_in "email",  :with => @user6.email
        #fill_in "password",  :with => @user6.password
        #page.find('.signin-icon').click
        ##@user6.valid?.should be true
        #@current_user=@user6
        ##@current_user.nil?.should be false
        ##response.should render_template(:overview)
        #visit overview_index_path("de")
        ##current_path.should == "/de/overview"
        ##page.should have_content("Rating")
      #end

      #it "should not allow user with fake login data to login" do
        #visit root_path
        #fill_in "email",  :with => "test@imimaps.com"
        #fill_in "password",  :with => "testFail"
        #page.find('.signin-icon').click
        #visit overview_index_path("de")
        ##response.should render_template(:session)
   #end

      #it "should not allow access if not logged in" do
        #visit overview_index_path("de")
        ##current_path.should == "/"
        #visit overview_index_path("de")
        ##current_path.should == "/"
   #end

       #it "should not allow access to any page if not logged in" do
        #visit general_index_path("de")
        ##current_path.should == "/"
        ##visit financing_index_path("de")
        ##current_path.should == "/"
        ##visit download_index_path("de")
        ##current_path.should == "/"
        ##visit faq_index_path("de")
        ##current_path.should == "/"
        #visit "/de/internships"
        ##current_path.should == "/"
        #visit overview_index_path("de")
        ##current_path.should == "/"

   #end
#end
