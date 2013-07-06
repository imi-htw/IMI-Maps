require 'spec_helper'

describe "Detailed Search Page should have content" do
     include Capybara::DSL
      it "should " do       
        @user6 = User.create!( password: "testIT", email: "test@imimaps.com")
        @user6.save
        visit root_path
        fill_in "email",  :with => @user6.email
        fill_in "password",  :with => @user6.password
        page.find('.signin-icon').click
        visit "/de/internships"
        page.should have_content("Lebenshaltungskosten")
        page.should have_content("Bewertung")
        page.should have_content("Gehalt")
        click_link "English" 
        page.should have_content("Cost of living")
        page.should have_content("salary")
        page.should have_content("Rating")
        page.should have_content(I18n.t('search.rating'))
        page.should have_content(I18n.t('search.resultnr'))
        #select('SS 13', :from => 'semester')
        #select('Brazil', :from => 'Choose a country')
        #select('United Kingdom', :from => 'country')
        #select('SS 12', :from => 'Choose a semester')
        #click_button "submit"
        #click_button "reset_chosen"
     end
end