require "spec_helper"

describe AssetListsController do
  describe "routing" do

    it "routes to #index" do
      get("/asset_lists").should route_to("asset_lists#index")
    end

    it "routes to #new" do
      get("/asset_lists/new").should route_to("asset_lists#new")
    end

    it "routes to #show" do
      get("/asset_lists/1").should route_to("asset_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/asset_lists/1/edit").should route_to("asset_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/asset_lists").should route_to("asset_lists#create")
    end

    it "routes to #update" do
      put("/asset_lists/1").should route_to("asset_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/asset_lists/1").should route_to("asset_lists#destroy", :id => "1")
    end

  end
end
