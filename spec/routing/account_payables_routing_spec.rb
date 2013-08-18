require "spec_helper"

describe AccountPayablesController do
  describe "routing" do

    it "routes to #index" do
      get("/account_payables").should route_to("account_payables#index")
    end

    it "routes to #new" do
      get("/account_payables/new").should route_to("account_payables#new")
    end

    it "routes to #show" do
      get("/account_payables/1").should route_to("account_payables#show", :id => "1")
    end

    it "routes to #edit" do
      get("/account_payables/1/edit").should route_to("account_payables#edit", :id => "1")
    end

    it "routes to #create" do
      post("/account_payables").should route_to("account_payables#create")
    end

    it "routes to #update" do
      put("/account_payables/1").should route_to("account_payables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/account_payables/1").should route_to("account_payables#destroy", :id => "1")
    end

  end
end
