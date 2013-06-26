require 'spec_helper'

describe "market_orders/index" do
  before(:each) do
    assign(:market_orders, [
      stub_model(MarketOrder,
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
      ),
      stub_model(MarketOrder,
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
      )
    ])
  end

  it "renders a list of market_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
