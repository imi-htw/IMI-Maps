require "spec_helper"

describe ContactPeopleController do
  describe "routing" do

    it "routes to #index" do
      get("/contact_people").should route_to("contact_people#index")
    end

    it "routes to #new" do
      get("/contact_people/new").should route_to("contact_people#new")
    end

    it "routes to #show" do
      get("/contact_people/1").should route_to("contact_people#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contact_people/1/edit").should route_to("contact_people#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contact_people").should route_to("contact_people#create")
    end

    it "routes to #update" do
      put("/contact_people/1").should route_to("contact_people#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contact_people/1").should route_to("contact_people#destroy", :id => "1")
    end

  end
end
