require 'spec_helper'

describe "blue_print_purchases/show" do
  before(:each) do
    @blue_print_purchase = assign(:blue_print_purchase, stub_model(BluePrintPurchase,
      :type_id => "Type",
      :use_count => "",
      :price => "",
      :comment => "Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Comment/)
  end
end
