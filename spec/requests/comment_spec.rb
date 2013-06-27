require 'spec_helper'


=begin

 describe "Favorites" do
    it "displays usercomments", :js => true do
      visit overview_index_path("de")      
      current_path.should == "/de/overview"
      #click_link favorite_index_path
      #page.should have_content("destroy")
     
    end
end

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
#@comment= UserComment.create!(:body => "paint fence" )
#current_path.should == "/" 
       	#current_path.should  redirect_to("overview#index")
        #fill_in "country", :with => "Germany"
        #fill_in "programming_language_ids", :with => "Java"
        #click_button "search_button"
        #page.should have_content('Company499')