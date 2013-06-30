require 'spec_helper'

describe "wallet_journals/index" do
  before(:each) do
    assign(:wallet_journals, [
      stub_model(WalletJournal,
        :transaction_id => "",
        :transaction_date_time => "",
        :transaction_type_id => "",
        :owner_name1 => "",
        :owner_id1 => "",
        :owner_name2 => "",
        :owner_id2 => "",
        :arg_name1 => "",
        :arg_id1 => "",
        :amount => "",
        :balance => "",
        :reason => "",
        :tax_receiver_id => "",
        :tax_amount => ""
      ),
      stub_model(WalletJournal,
        :transaction_id => "",
        :transaction_date_time => "",
        :transaction_type_id => "",
        :owner_name1 => "",
        :owner_id1 => "",
        :owner_name2 => "",
        :owner_id2 => "",
        :arg_name1 => "",
        :arg_id1 => "",
        :amount => "",
        :balance => "",
        :reason => "",
        :tax_receiver_id => "",
        :tax_amount => ""
      )
    ])
  end

  it "renders a list of wallet_journals" do
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
  end
end
