require 'spec_helper'

describe "inventory_clearance_settings/edit" do
  before(:each) do
    @inventory_clearance_setting = assign(:inventory_clearance_setting, stub_model(InventoryClearanceSetting,
      :flag_id => ""
    ))
  end

  it "renders the edit inventory_clearance_setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", inventory_clearance_setting_path(@inventory_clearance_setting), "post" do
      assert_select "input#inventory_clearance_setting_flag_id[name=?]", "inventory_clearance_setting[flag_id]"
    end
  end
end
