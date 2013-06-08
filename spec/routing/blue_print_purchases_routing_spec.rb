require "spec_helper"

describe BluePrintPurchasesController do
  describe "routing" do

    it "routes to #index" do
      get("/blue_print_purchases").should route_to("blue_print_purchases#index")
    end

    it "routes to #new" do
      get("/blue_print_purchases/new").should route_to("blue_print_purchases#new")
    end

    it "routes to #show" do
      get("/blue_print_purchases/1").should route_to("blue_print_purchases#show", :id => "1")
    end

    it "routes to #edit" do
      get("/blue_print_purchases/1/edit").should route_to("blue_print_purchases#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blue_print_purchases").should route_to("blue_print_purchases#create")
    end

    it "routes to #update" do
      put("/blue_print_purchases/1").should route_to("blue_print_purchases#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blue_print_purchases/1").should route_to("blue_print_purchases#destroy", :id => "1")
    end

  end
end
