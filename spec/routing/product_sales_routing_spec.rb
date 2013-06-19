require "spec_helper"

describe ProductSalesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_sales").should route_to("product_sales#index")
    end

    it "routes to #new" do
      get("/product_sales/new").should route_to("product_sales#new")
    end

    it "routes to #show" do
      get("/product_sales/1").should route_to("product_sales#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_sales/1/edit").should route_to("product_sales#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_sales").should route_to("product_sales#create")
    end

    it "routes to #update" do
      put("/product_sales/1").should route_to("product_sales#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_sales/1").should route_to("product_sales#destroy", :id => "1")
    end

  end
end
