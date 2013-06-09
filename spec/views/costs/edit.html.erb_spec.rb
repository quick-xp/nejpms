require 'spec_helper'

describe "costs/edit" do
  before(:each) do
    @cost = assign(:cost, stub_model(Cost,
      :type_id => "",
      :per_price => "",
      :type => ""
    ))
  end

  it "renders the edit cost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cost_path(@cost), "post" do
      assert_select "input#cost_type_id[name=?]", "cost[type_id]"
      assert_select "input#cost_per_price[name=?]", "cost[per_price]"
      assert_select "input#cost_type[name=?]", "cost[type]"
    end
  end
end
