require "spec_helper"

describe UserListsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_lists").should route_to("user_lists#index")
    end

    it "routes to #new" do
      get("/user_lists/new").should route_to("user_lists#new")
    end

    it "routes to #show" do
      get("/user_lists/1").should route_to("user_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_lists/1/edit").should route_to("user_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_lists").should route_to("user_lists#create")
    end

    it "routes to #update" do
      put("/user_lists/1").should route_to("user_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_lists/1").should route_to("user_lists#destroy", :id => "1")
    end

  end
end
