require "spec_helper"

describe AssetListMastersController do
  describe "routing" do

    it "routes to #index" do
      get("/asset_list_masters").should route_to("asset_list_masters#index")
    end

    it "routes to #new" do
      get("/asset_list_masters/new").should route_to("asset_list_masters#new")
    end

    it "routes to #show" do
      get("/asset_list_masters/1").should route_to("asset_list_masters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/asset_list_masters/1/edit").should route_to("asset_list_masters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/asset_list_masters").should route_to("asset_list_masters#create")
    end

    it "routes to #update" do
      put("/asset_list_masters/1").should route_to("asset_list_masters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/asset_list_masters/1").should route_to("asset_list_masters#destroy", :id => "1")
    end

  end
end
