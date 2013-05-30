require 'spec_helper'

describe "material_purchases/index" do
  before(:each) do
    assign(:material_purchases, [
      stub_model(MaterialPurchase,
        :transaction_id => "",
        :type_id => "",
        :quantity => "",
        :price => "",
        :station_id => ""
      ),
      stub_model(MaterialPurchase,
        :transaction_id => "",
        :type_id => "",
        :quantity => "",
        :price => "",
        :station_id => ""
      )
    ])
  end

  it "renders a list of material_purchases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
