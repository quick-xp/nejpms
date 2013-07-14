require 'spec_helper'

describe "AssetListMasters" do
  describe "GET /asset_list_masters" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get asset_list_masters_path
      response.status.should be(200)
    end
  end
end
