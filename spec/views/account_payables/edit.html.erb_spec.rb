require 'spec_helper'

describe "account_payables/edit" do
  before(:each) do
    @account_payable = assign(:account_payable, stub_model(AccountPayable,
      :transaction_date_time => "",
      :user_id => "",
      :price => "",
      :status => "",
      :comment => "",
      :operation_date_time => ""
    ))
  end

  it "renders the edit account_payable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_payable_path(@account_payable), "post" do
      assert_select "input#account_payable_transaction_date_time[name=?]", "account_payable[transaction_date_time]"
      assert_select "input#account_payable_user_id[name=?]", "account_payable[user_id]"
      assert_select "input#account_payable_price[name=?]", "account_payable[price]"
      assert_select "input#account_payable_status[name=?]", "account_payable[status]"
      assert_select "input#account_payable_comment[name=?]", "account_payable[comment]"
      assert_select "input#account_payable_operation_date_time[name=?]", "account_payable[operation_date_time]"
    end
  end
end
