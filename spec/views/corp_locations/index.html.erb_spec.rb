require 'spec_helper'

describe "corp_locations/index" do
  before(:each) do
    assign(:corp_locations, [
      stub_model(CorpLocation,
        :station_id => "",
        :station_name => ""
      ),
      stub_model(CorpLocation,
        :station_id => "",
        :station_name => ""
      )
    ])
  end

  it "renders a list of corp_locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
