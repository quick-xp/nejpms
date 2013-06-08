require 'spec_helper'

describe "blue_print_purchases/new" do
  before(:each) do
    assign(:blue_print_purchase, stub_model(BluePrintPurchase,
      :type_id => "MyString",
      :use_count => "",
      :price => "",
      :comment => "MyString"
    ).as_new_record)
  end

  it "renders new blue_print_purchase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blue_print_purchases_path, "post" do
      assert_select "input#blue_print_purchase_type_id[name=?]", "blue_print_purchase[type_id]"
      assert_select "input#blue_print_purchase_use_count[name=?]", "blue_print_purchase[use_count]"
      assert_select "input#blue_print_purchase_price[name=?]", "blue_print_purchase[price]"
      assert_select "input#blue_print_purchase_comment[name=?]", "blue_print_purchase[comment]"
    end
  end
end
