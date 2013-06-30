require "spec_helper"

describe WalletJournalsController do
  describe "routing" do

    it "routes to #index" do
      get("/wallet_journals").should route_to("wallet_journals#index")
    end

    it "routes to #new" do
      get("/wallet_journals/new").should route_to("wallet_journals#new")
    end

    it "routes to #show" do
      get("/wallet_journals/1").should route_to("wallet_journals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wallet_journals/1/edit").should route_to("wallet_journals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wallet_journals").should route_to("wallet_journals#create")
    end

    it "routes to #update" do
      put("/wallet_journals/1").should route_to("wallet_journals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wallet_journals/1").should route_to("wallet_journals#destroy", :id => "1")
    end

  end
end
