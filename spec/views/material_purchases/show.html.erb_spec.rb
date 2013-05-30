require 'spec_helper'

describe "material_purchases/show" do
  before(:each) do
    @material_purchase = assign(:material_purchase, stub_model(MaterialPurchase,
      :transaction_id => "",
      :type_id => "",
      :quantity => "",
      :price => "",
      :station_id => ""
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
  end
end
