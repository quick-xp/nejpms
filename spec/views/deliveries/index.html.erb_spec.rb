require 'spec_helper'

describe "deliveries/index" do
  before(:each) do
    assign(:deliveries, [
      stub_model(Delivery,
        :type_id => "",
        :quantity => "",
        :station_id => "",
        :add_date => ""
      ),
      stub_model(Delivery,
        :type_id => "",
        :quantity => "",
        :station_id => "",
        :add_date => ""
      )
    ])
  end

  it "renders a list of deliveries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
