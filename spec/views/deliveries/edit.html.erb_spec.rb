require 'spec_helper'

describe "deliveries/edit" do
  before(:each) do
    @delivery = assign(:delivery, stub_model(Delivery,
      :type_id => "",
      :quantity => "",
      :station_id => "",
      :add_date => ""
    ))
  end

  it "renders the edit delivery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", delivery_path(@delivery), "post" do
      assert_select "input#delivery_type_id[name=?]", "delivery[type_id]"
      assert_select "input#delivery_quantity[name=?]", "delivery[quantity]"
      assert_select "input#delivery_station_id[name=?]", "delivery[station_id]"
      assert_select "input#delivery_add_date[name=?]", "delivery[add_date]"
    end
  end
end
