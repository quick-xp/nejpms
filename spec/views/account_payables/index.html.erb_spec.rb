require 'spec_helper'

describe "account_payables/index" do
  before(:each) do
    assign(:account_payables, [
      stub_model(AccountPayable,
        :transaction_date_time => "",
        :user_id => "",
        :price => "",
        :status => "",
        :comment => "",
        :operation_date_time => ""
      ),
      stub_model(AccountPayable,
        :transaction_date_time => "",
        :user_id => "",
        :price => "",
        :status => "",
        :comment => "",
        :operation_date_time => ""
      )
    ])
  end

  it "renders a list of account_payables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
