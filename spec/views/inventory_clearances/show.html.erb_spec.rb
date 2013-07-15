require 'spec_helper'

describe "inventory_clearances/show" do
  before(:each) do
    @inventory_clearance = assign(:inventory_clearance, stub_model(InventoryClearance,
      :type_id => "",
      :type_name => "",
      :current_quantity => "",
      :current_sync_quantity => "",
      :new_quantity => ""
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
