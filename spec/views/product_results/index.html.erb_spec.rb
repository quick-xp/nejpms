require 'spec_helper'

describe "product_results/index" do
  before(:each) do
    assign(:product_results, [
      stub_model(ProductResult,
        :type_id => "",
        :owner_id => "",
        :create_count => "",
        :sum_price => ""
      ),
      stub_model(ProductResult,
        :type_id => "",
        :owner_id => "",
        :create_count => "",
        :sum_price => ""
      )
    ])
  end

  it "renders a list of product_results" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
