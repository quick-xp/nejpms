require "spec_helper"

describe InventoryClearanceSettingsController do
  describe "routing" do

    it "routes to #index" do
      get("/inventory_clearance_settings").should route_to("inventory_clearance_settings#index")
    end

    it "routes to #new" do
      get("/inventory_clearance_settings/new").should route_to("inventory_clearance_settings#new")
    end

    it "routes to #show" do
      get("/inventory_clearance_settings/1").should route_to("inventory_clearance_settings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inventory_clearance_settings/1/edit").should route_to("inventory_clearance_settings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inventory_clearance_settings").should route_to("inventory_clearance_settings#create")
    end

    it "routes to #update" do
      put("/inventory_clearance_settings/1").should route_to("inventory_clearance_settings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inventory_clearance_settings/1").should route_to("inventory_clearance_settings#destroy", :id => "1")
    end

  end
end
