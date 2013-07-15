require "spec_helper"

describe InventoryClearancesController do
  describe "routing" do

    it "routes to #index" do
      get("/inventory_clearances").should route_to("inventory_clearances#index")
    end

    it "routes to #new" do
      get("/inventory_clearances/new").should route_to("inventory_clearances#new")
    end

    it "routes to #show" do
      get("/inventory_clearances/1").should route_to("inventory_clearances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inventory_clearances/1/edit").should route_to("inventory_clearances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inventory_clearances").should route_to("inventory_clearances#create")
    end

    it "routes to #update" do
      put("/inventory_clearances/1").should route_to("inventory_clearances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inventory_clearances/1").should route_to("inventory_clearances#destroy", :id => "1")
    end

  end
end
