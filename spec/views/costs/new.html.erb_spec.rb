require 'spec_helper'

describe "costs/new" do
  before(:each) do
    assign(:cost, stub_model(Cost,
      :type_id => "",
      :per_price => "",
      :type => ""
    ).as_new_record)
  end

  it "renders new cost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", costs_path, "post" do
      assert_select "input#cost_type_id[name=?]", "cost[type_id]"
      assert_select "input#cost_per_price[name=?]", "cost[per_price]"
      assert_select "input#cost_type[name=?]", "cost[type]"
    end
  end
end
