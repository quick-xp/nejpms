require 'spec_helper'

describe "costs/show" do
  before(:each) do
    @cost = assign(:cost, stub_model(Cost,
      :type_id => "",
      :per_price => "",
      :type => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
