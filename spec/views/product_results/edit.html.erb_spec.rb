require 'spec_helper'

describe "product_results/edit" do
  before(:each) do
    @product_result = assign(:product_result, stub_model(ProductResult,
      :type_id => "",
      :owner_id => "",
      :create_count => "",
      :sum_price => ""
    ))
  end

  it "renders the edit product_result form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_result_path(@product_result), "post" do
      assert_select "input#product_result_type_id[name=?]", "product_result[type_id]"
      assert_select "input#product_result_owner_id[name=?]", "product_result[owner_id]"
      assert_select "input#product_result_create_count[name=?]", "product_result[create_count]"
      assert_select "input#product_result_sum_price[name=?]", "product_result[sum_price]"
    end
  end
end
