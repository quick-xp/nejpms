require 'spec_helper'

describe "product_sales/show" do
  before(:each) do
    @product_sale = assign(:product_sale, stub_model(ProductSale,
      :transaction_id => "",
      :quantity => "",
      :type_id => "",
      :price => "",
      :client_id => "",
      :station_id => "",
      :journal_transaction_id => ""
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
    rendered.should match(//)
    rendered.should match(//)
  end
end
