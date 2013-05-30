require 'spec_helper'

describe "material_purchases/edit" do
  before(:each) do
    @material_purchase = assign(:material_purchase, stub_model(MaterialPurchase,
      :transaction_id => "",
      :type_id => "",
      :quantity => "",
      :price => "",
      :station_id => ""
    ))
  end

  it "renders the edit material_purchase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", material_purchase_path(@material_purchase), "post" do
      assert_select "input#material_purchase_transaction_id[name=?]", "material_purchase[transaction_id]"
      assert_select "input#material_purchase_type_id[name=?]", "material_purchase[type_id]"
      assert_select "input#material_purchase_quantity[name=?]", "material_purchase[quantity]"
      assert_select "input#material_purchase_price[name=?]", "material_purchase[price]"
      assert_select "input#material_purchase_station_id[name=?]", "material_purchase[station_id]"
    end
  end
end
