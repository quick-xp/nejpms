require 'spec_helper'

describe "asset_list_masters/index" do
  before(:each) do
    assign(:asset_list_masters, [
      stub_model(AssetListMaster,
        :type_id => "",
        :quantity => ""
      ),
      stub_model(AssetListMaster,
        :type_id => "",
        :quantity => ""
      )
    ])
  end

  it "renders a list of asset_list_masters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
