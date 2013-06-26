require 'spec_helper'

describe "market_orders/show" do
  before(:each) do
    @market_order = assign(:market_order, stub_model(MarketOrder,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
