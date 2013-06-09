require 'spec_helper'

describe "costs/index" do
  before(:each) do
    assign(:costs, [
      stub_model(Cost,
        :type_id => "",
        :per_price => "",
        :type => ""
      ),
      stub_model(Cost,
        :type_id => "",
        :per_price => "",
        :type => ""
      )
    ])
  end

  it "renders a list of costs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
