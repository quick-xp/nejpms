require "spec_helper"

describe MaterialPurchasesController do
  describe "routing" do

    it "routes to #index" do
      get("/material_purchases").should route_to("material_purchases#index")
    end

    it "routes to #new" do
      get("/material_purchases/new").should route_to("material_purchases#new")
    end

    it "routes to #show" do
      get("/material_purchases/1").should route_to("material_purchases#show", :id => "1")
    end

    it "routes to #edit" do
      get("/material_purchases/1/edit").should route_to("material_purchases#edit", :id => "1")
    end

    it "routes to #create" do
      post("/material_purchases").should route_to("material_purchases#create")
    end

    it "routes to #update" do
      put("/material_purchases/1").should route_to("material_purchases#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/material_purchases/1").should route_to("material_purchases#destroy", :id => "1")
    end

  end
end
