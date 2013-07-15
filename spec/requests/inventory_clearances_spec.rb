require 'spec_helper'

describe "InventoryClearances" do
  describe "GET /inventory_clearances" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get inventory_clearances_path
      response.status.should be(200)
    end
  end
end
