require 'spec_helper'

describe "deliveries/new" do
  before(:each) do
    assign(:delivery, stub_model(Delivery,
      :type_id => "",
      :quantity => "",
      :station_id => "",
      :add_date => ""
    ).as_new_record)
  end

  it "renders new delivery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deliveries_path, "post" do
      assert_select "input#delivery_type_id[name=?]", "delivery[type_id]"
      assert_select "input#delivery_quantity[name=?]", "delivery[quantity]"
      assert_select "input#delivery_station_id[name=?]", "delivery[station_id]"
      assert_select "input#delivery_add_date[name=?]", "delivery[add_date]"
    end
  end
end
