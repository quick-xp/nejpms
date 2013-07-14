require 'spec_helper'

describe "corp_locations/show" do
  before(:each) do
    @corp_location = assign(:corp_location, stub_model(CorpLocation,
      :station_id => "",
      :station_name => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
