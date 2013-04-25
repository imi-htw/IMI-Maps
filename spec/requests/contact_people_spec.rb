require 'spec_helper'

describe "ContactPeople" do
  describe "GET /contact_people" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get contact_people_path
      response.status.should be(200)
    end
  end
end
