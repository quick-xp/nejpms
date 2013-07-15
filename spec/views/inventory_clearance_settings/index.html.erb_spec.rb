require 'spec_helper'

describe "inventory_clearance_settings/index" do
  before(:each) do
    assign(:inventory_clearance_settings, [
      stub_model(InventoryClearanceSetting,
        :flag_id => ""
      ),
      stub_model(InventoryClearanceSetting,
        :flag_id => ""
      )
    ])
  end

  it "renders a list of inventory_clearance_settings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
