require 'spec_helper'

describe "CorpLocations" do
  describe "GET /corp_locations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get corp_locations_path
      response.status.should be(200)
    end
  end
end
