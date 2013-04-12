require "spec_helper"

describe InternshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/internships").should route_to("internships#index")
    end

    it "routes to #new" do
      get("/internships/new").should route_to("internships#new")
    end

    it "routes to #show" do
      get("/internships/1").should route_to("internships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/internships/1/edit").should route_to("internships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/internships").should route_to("internships#create")
    end

    it "routes to #update" do
      put("/internships/1").should route_to("internships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/internships/1").should route_to("internships#destroy", :id => "1")
    end

  end
end
