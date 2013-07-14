require "spec_helper"

describe CorpLocationsController do
  describe "routing" do

    it "routes to #index" do
      get("/corp_locations").should route_to("corp_locations#index")
    end

    it "routes to #new" do
      get("/corp_locations/new").should route_to("corp_locations#new")
    end

    it "routes to #show" do
      get("/corp_locations/1").should route_to("corp_locations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/corp_locations/1/edit").should route_to("corp_locations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/corp_locations").should route_to("corp_locations#create")
    end

    it "routes to #update" do
      put("/corp_locations/1").should route_to("corp_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/corp_locations/1").should route_to("corp_locations#destroy", :id => "1")
    end

  end
end
