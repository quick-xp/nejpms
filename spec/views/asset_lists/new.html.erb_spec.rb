require 'spec_helper'

describe "asset_lists/new" do
  before(:each) do
    assign(:asset_list, stub_model(AssetList,
      :item_id => "",
      :quantity => "",
      :type_id => "",
      :location_id => "",
      :flag => ""
    ).as_new_record)
  end

  it "renders new asset_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", asset_lists_path, "post" do
      assert_select "input#asset_list_item_id[name=?]", "asset_list[item_id]"
      assert_select "input#asset_list_quantity[name=?]", "asset_list[quantity]"
      assert_select "input#asset_list_type_id[name=?]", "asset_list[type_id]"
      assert_select "input#asset_list_location_id[name=?]", "asset_list[location_id]"
      assert_select "input#asset_list_flag[name=?]", "asset_list[flag]"
    end
  end
end
