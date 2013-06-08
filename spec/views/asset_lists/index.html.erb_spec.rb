require 'spec_helper'

describe "asset_lists/index" do
  before(:each) do
    assign(:asset_lists, [
      stub_model(AssetList,
        :item_id => "",
        :quantity => "",
        :type_id => "",
        :location_id => "",
        :flag => ""
      ),
      stub_model(AssetList,
        :item_id => "",
        :quantity => "",
        :type_id => "",
        :location_id => "",
        :flag => ""
      )
    ])
  end

  it "renders a list of asset_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
