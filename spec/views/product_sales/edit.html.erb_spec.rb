require 'spec_helper'

describe "product_sales/edit" do
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

  it "renders the edit product_sale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_sale_path(@product_sale), "post" do
      assert_select "input#product_sale_transaction_id[name=?]", "product_sale[transaction_id]"
      assert_select "input#product_sale_quantity[name=?]", "product_sale[quantity]"
      assert_select "input#product_sale_type_id[name=?]", "product_sale[type_id]"
      assert_select "input#product_sale_price[name=?]", "product_sale[price]"
      assert_select "input#product_sale_client_id[name=?]", "product_sale[client_id]"
      assert_select "input#product_sale_station_id[name=?]", "product_sale[station_id]"
      assert_select "input#product_sale_journal_transaction_id[name=?]", "product_sale[journal_transaction_id]"
    end
  end
end
