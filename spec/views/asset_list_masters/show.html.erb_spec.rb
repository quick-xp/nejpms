require 'spec_helper'

describe "asset_list_masters/show" do
  before(:each) do
    @asset_list_master = assign(:asset_list_master, stub_model(AssetListMaster,
      :type_id => "",
      :quantity => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
