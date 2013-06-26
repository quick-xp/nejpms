require 'spec_helper'

describe "market_orders/new" do
  before(:each) do
    assign(:market_order, stub_model(MarketOrder,
      :order_id => "",
      :char_id => "",
      :station_id => "",
      :vol_entered => "",
      :vol_remaining => "",
      :min_volume => "",
      :order_state => "",
      :order_state => "",
      :type_id => "",
      :range => "",
      :account_key => "",
      :duration => "",
      :escrow => "",
      :price => "",
      :bid => "",
      :issue => ""
    ).as_new_record)
  end

  it "renders new market_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", market_orders_path, "post" do
      assert_select "input#market_order_order_id[name=?]", "market_order[order_id]"
      assert_select "input#market_order_char_id[name=?]", "market_order[char_id]"
      assert_select "input#market_order_station_id[name=?]", "market_order[station_id]"
      assert_select "input#market_order_vol_entered[name=?]", "market_order[vol_entered]"
      assert_select "input#market_order_vol_remaining[name=?]", "market_order[vol_remaining]"
      assert_select "input#market_order_min_volume[name=?]", "market_order[min_volume]"
      assert_select "input#market_order_order_state[name=?]", "market_order[order_state]"
      assert_select "input#market_order_order_state[name=?]", "market_order[order_state]"
      assert_select "input#market_order_type_id[name=?]", "market_order[type_id]"
      assert_select "input#market_order_range[name=?]", "market_order[range]"
      assert_select "input#market_order_account_key[name=?]", "market_order[account_key]"
      assert_select "input#market_order_duration[name=?]", "market_order[duration]"
      assert_select "input#market_order_escrow[name=?]", "market_order[escrow]"
      assert_select "input#market_order_price[name=?]", "market_order[price]"
      assert_select "input#market_order_bid[name=?]", "market_order[bid]"
      assert_select "input#market_order_issue[name=?]", "market_order[issue]"
    end
  end
end
