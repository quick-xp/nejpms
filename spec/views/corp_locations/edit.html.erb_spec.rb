require 'spec_helper'

describe "corp_locations/edit" do
  before(:each) do
    @corp_location = assign(:corp_location, stub_model(CorpLocation,
      :station_id => "",
      :station_name => ""
    ))
  end

  it "renders the edit corp_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", corp_location_path(@corp_location), "post" do
      assert_select "input#corp_location_station_id[name=?]", "corp_location[station_id]"
      assert_select "input#corp_location_station_name[name=?]", "corp_location[station_name]"
    end
  end
end
