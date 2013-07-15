require 'spec_helper'

describe "inventory_clearances/index" do
  before(:each) do
    assign(:inventory_clearances, [
      stub_model(InventoryClearance,
        :type_id => "",
        :type_name => "",
        :current_quantity => "",
        :current_sync_quantity => "",
        :new_quantity => ""
      ),
      stub_model(InventoryClearance,
        :type_id => "",
        :type_name => "",
        :current_quantity => "",
        :current_sync_quantity => "",
        :new_quantity => ""
      )
    ])
  end

  it "renders a list of inventory_clearances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
