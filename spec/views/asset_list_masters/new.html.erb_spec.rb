require 'spec_helper'

describe "asset_list_masters/new" do
  before(:each) do
    assign(:asset_list_master, stub_model(AssetListMaster,
      :type_id => "",
      :quantity => ""
    ).as_new_record)
  end

  it "renders new asset_list_master form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", asset_list_masters_path, "post" do
      assert_select "input#asset_list_master_type_id[name=?]", "asset_list_master[type_id]"
      assert_select "input#asset_list_master_quantity[name=?]", "asset_list_master[quantity]"
    end
  end
end
