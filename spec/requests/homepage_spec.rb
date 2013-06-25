require 'spec_helper'

describe "Homepage" do
	include Capybara::DSL
  it "should ask for sign in" do
    visit root_path
    page.should have_content("Please Sign In")
  end
end
