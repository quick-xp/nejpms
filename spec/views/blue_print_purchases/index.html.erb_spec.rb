require 'spec_helper'

describe "blue_print_purchases/index" do
  before(:each) do
    assign(:blue_print_purchases, [
      stub_model(BluePrintPurchase,
        :type_id => "Type",
        :use_count => "",
        :price => "",
        :comment => "Comment"
      ),
      stub_model(BluePrintPurchase,
        :type_id => "Type",
        :use_count => "",
        :price => "",
        :comment => "Comment"
      )
    ])
  end

  it "renders a list of blue_print_purchases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
