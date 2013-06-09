require 'spec_helper'

describe "product_results/show" do
  before(:each) do
    @product_result = assign(:product_result, stub_model(ProductResult,
      :type_id => "",
      :owner_id => "",
      :create_count => "",
      :sum_price => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
