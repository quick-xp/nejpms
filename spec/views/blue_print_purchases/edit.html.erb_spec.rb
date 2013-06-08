require 'spec_helper'

describe "blue_print_purchases/edit" do
  before(:each) do
    @blue_print_purchase = assign(:blue_print_purchase, stub_model(BluePrintPurchase,
      :type_id => "MyString",
      :use_count => "",
      :price => "",
      :comment => "MyString"
    ))
  end

  it "renders the edit blue_print_purchase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blue_print_purchase_path(@blue_print_purchase), "post" do
      assert_select "input#blue_print_purchase_type_id[name=?]", "blue_print_purchase[type_id]"
      assert_select "input#blue_print_purchase_use_count[name=?]", "blue_print_purchase[use_count]"
      assert_select "input#blue_print_purchase_price[name=?]", "blue_print_purchase[price]"
      assert_select "input#blue_print_purchase_comment[name=?]", "blue_print_purchase[comment]"
    end
  end
end
