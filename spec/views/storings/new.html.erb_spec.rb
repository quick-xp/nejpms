require 'spec_helper'

describe "storings/new" do
  before(:each) do
    assign(:storing, stub_model(Storing,
      :type_id => "",
      :quantity => "",
      :station_id => ""
    ).as_new_record)
  end

  it "renders new storing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", storings_path, "post" do
      assert_select "input#storing_type_id[name=?]", "storing[type_id]"
      assert_select "input#storing_quantity[name=?]", "storing[quantity]"
      assert_select "input#storing_station_id[name=?]", "storing[station_id]"
    end
  end
end
