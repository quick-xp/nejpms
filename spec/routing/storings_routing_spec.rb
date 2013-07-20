require "spec_helper"

describe StoringsController do
  describe "routing" do

    it "routes to #index" do
      get("/storings").should route_to("storings#index")
    end

    it "routes to #new" do
      get("/storings/new").should route_to("storings#new")
    end

    it "routes to #show" do
      get("/storings/1").should route_to("storings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/storings/1/edit").should route_to("storings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/storings").should route_to("storings#create")
    end

    it "routes to #update" do
      put("/storings/1").should route_to("storings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/storings/1").should route_to("storings#destroy", :id => "1")
    end

  end
end
