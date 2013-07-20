require 'spec_helper'

describe "storings/show" do
  before(:each) do
    @storing = assign(:storing, stub_model(Storing,
      :type_id => "",
      :quantity => "",
      :station_id => ""
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
