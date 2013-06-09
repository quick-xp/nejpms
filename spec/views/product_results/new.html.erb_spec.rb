require 'spec_helper'

describe "product_results/new" do
  before(:each) do
    assign(:product_result, stub_model(ProductResult,
      :type_id => "",
      :owner_id => "",
      :create_count => "",
      :sum_price => ""
    ).as_new_record)
  end

  it "renders new product_result form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_results_path, "post" do
      assert_select "input#product_result_type_id[name=?]", "product_result[type_id]"
      assert_select "input#product_result_owner_id[name=?]", "product_result[owner_id]"
      assert_select "input#product_result_create_count[name=?]", "product_result[create_count]"
      assert_select "input#product_result_sum_price[name=?]", "product_result[sum_price]"
    end
  end
end
