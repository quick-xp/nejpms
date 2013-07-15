require 'spec_helper'

describe "inventory_clearances/new" do
  before(:each) do
    assign(:inventory_clearance, stub_model(InventoryClearance,
      :type_id => "",
      :type_name => "",
      :current_quantity => "",
      :current_sync_quantity => "",
      :new_quantity => ""
    ).as_new_record)
  end

  it "renders new inventory_clearance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", inventory_clearances_path, "post" do
      assert_select "input#inventory_clearance_type_id[name=?]", "inventory_clearance[type_id]"
      assert_select "input#inventory_clearance_type_name[name=?]", "inventory_clearance[type_name]"
      assert_select "input#inventory_clearance_current_quantity[name=?]", "inventory_clearance[current_quantity]"
      assert_select "input#inventory_clearance_current_sync_quantity[name=?]", "inventory_clearance[current_sync_quantity]"
      assert_select "input#inventory_clearance_new_quantity[name=?]", "inventory_clearance[new_quantity]"
    end
  end
end
