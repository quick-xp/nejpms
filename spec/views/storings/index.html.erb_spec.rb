require 'spec_helper'

describe "storings/index" do
  before(:each) do
    assign(:storings, [
      stub_model(Storing,
        :type_id => "",
        :quantity => "",
        :station_id => ""
      ),
      stub_model(Storing,
        :type_id => "",
        :quantity => "",
        :station_id => ""
      )
    ])
  end

  it "renders a list of storings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
