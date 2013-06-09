require "spec_helper"

describe ProductResultsController do
  describe "routing" do

    it "routes to #index" do
      get("/product_results").should route_to("product_results#index")
    end

    it "routes to #new" do
      get("/product_results/new").should route_to("product_results#new")
    end

    it "routes to #show" do
      get("/product_results/1").should route_to("product_results#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_results/1/edit").should route_to("product_results#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_results").should route_to("product_results#create")
    end

    it "routes to #update" do
      put("/product_results/1").should route_to("product_results#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_results/1").should route_to("product_results#destroy", :id => "1")
    end

  end
end
