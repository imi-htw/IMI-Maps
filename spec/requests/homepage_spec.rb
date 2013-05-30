require 'spec_helper'

describe "Homepage" do
  it "should ask for sign in" do
    visit root_path
    page.should have_content("Please Sign In")
  end
end
