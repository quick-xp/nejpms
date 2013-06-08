require 'spec_helper'

describe "asset_lists/show" do
  before(:each) do
    @asset_list = assign(:asset_list, stub_model(AssetList,
      :item_id => "",
      :quantity => "",
      :type_id => "",
      :location_id => "",
      :flag => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
