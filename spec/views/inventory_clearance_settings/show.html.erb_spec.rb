require 'spec_helper'

describe "inventory_clearance_settings/show" do
  before(:each) do
    @inventory_clearance_setting = assign(:inventory_clearance_setting, stub_model(InventoryClearanceSetting,
      :flag_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
