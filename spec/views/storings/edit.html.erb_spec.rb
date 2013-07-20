require 'spec_helper'

describe "storings/edit" do
  before(:each) do
    @storing = assign(:storing, stub_model(Storing,
      :type_id => "",
      :quantity => "",
      :station_id => ""
    ))
  end

  it "renders the edit storing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", storing_path(@storing), "post" do
      assert_select "input#storing_type_id[name=?]", "storing[type_id]"
      assert_select "input#storing_quantity[name=?]", "storing[quantity]"
      assert_select "input#storing_station_id[name=?]", "storing[station_id]"
    end
  end
end
