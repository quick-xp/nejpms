require 'spec_helper'

describe "WalletJournals" do
  describe "GET /wallet_journals" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get wallet_journals_path
      response.status.should be(200)
    end
  end
end
