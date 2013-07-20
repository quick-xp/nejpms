require 'spec_helper'

describe "deliveries/show" do
  before(:each) do
    @delivery = assign(:delivery, stub_model(Delivery,
      :type_id => "",
      :quantity => "",
      :station_id => "",
      :add_date => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
