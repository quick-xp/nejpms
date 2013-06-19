require 'spec_helper'

describe "product_sales/index" do
  before(:each) do
    assign(:product_sales, [
      stub_model(ProductSale,
        :transaction_id => "",
        :quantity => "",
        :type_id => "",
        :price => "",
        :client_id => "",
        :station_id => "",
        :journal_transaction_id => ""
      ),
      stub_model(ProductSale,
        :transaction_id => "",
        :quantity => "",
        :type_id => "",
        :price => "",
        :client_id => "",
        :station_id => "",
        :journal_transaction_id => ""
      )
    ])
  end

  it "renders a list of product_sales" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
