require "spec_helper"

describe MarketOrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/market_orders").should route_to("market_orders#index")
    end

    it "routes to #new" do
      get("/market_orders/new").should route_to("market_orders#new")
    end

    it "routes to #show" do
      get("/market_orders/1").should route_to("market_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/market_orders/1/edit").should route_to("market_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/market_orders").should route_to("market_orders#create")
    end

    it "routes to #update" do
      put("/market_orders/1").should route_to("market_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/market_orders/1").should route_to("market_orders#destroy", :id => "1")
    end

  end
end
