require 'spec_helper'

describe "corp_locations/new" do
  before(:each) do
    assign(:corp_location, stub_model(CorpLocation,
      :station_id => "",
      :station_name => ""
    ).as_new_record)
  end

  it "renders new corp_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", corp_locations_path, "post" do
      assert_select "input#corp_location_station_id[name=?]", "corp_location[station_id]"
      assert_select "input#corp_location_station_name[name=?]", "corp_location[station_name]"
    end
  end
end
