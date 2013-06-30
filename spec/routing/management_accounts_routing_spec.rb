require "spec_helper"

describe ManagementAccountsController do
  describe "routing" do

    it "routes to #index" do
      get("/management_accounts").should route_to("management_accounts#index")
    end

    it "routes to #new" do
      get("/management_accounts/new").should route_to("management_accounts#new")
    end

    it "routes to #show" do
      get("/management_accounts/1").should route_to("management_accounts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/management_accounts/1/edit").should route_to("management_accounts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/management_accounts").should route_to("management_accounts#create")
    end

    it "routes to #update" do
      put("/management_accounts/1").should route_to("management_accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/management_accounts/1").should route_to("management_accounts#destroy", :id => "1")
    end

  end
end
