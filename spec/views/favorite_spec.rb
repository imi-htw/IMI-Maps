require 'spec_helper'




 describe "Favorites Page" do
  include Capybara::DSL
    it "should display Favorites" do
        @user6 = User.create!( password: "testCo", email: "test@imimaps.com")
        @user6.save
        visit root_path
        fill_in "email",  :with => @user6.email
        fill_in "password",  :with => @user6.password
        page.find('.signin-icon').click
        @user6.valid?.should be_true
        @current_user=@user6
        @current_user.nil?.should be_false
        response.should render_template(:overview)
        visit favorite_index_path("de")      
        page.should have_content("Meine Favoriten")  
    end
end

=begin
describe "search" do
    it "displays usercomments", :js => true do
      visit root_path
      fill_in "email",  :with => "test@imimaps.com"
      fill_in "password",  :with => "test"
      click_button "Log In" 
      #response.should respond_with 200
      click_link (link_to_unless_current "Deutsch", locale: "de")
      response.should render_template(:overview)
      page.should have_content("quicksearches_path")
      select "Germany", :from => '#country_td'
      fill_in "programming_language_ids", :with => "Java"
      
      click_button "search_button"
      
     
    end
end
=end
