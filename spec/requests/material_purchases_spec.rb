require 'spec_helper'

describe "MaterialPurchases" do
  describe "GET /material_purchases" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get material_purchases_path
      response.status.should be(200)
    end
  end
end
