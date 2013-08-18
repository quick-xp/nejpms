require 'spec_helper'

describe "account_payables/show" do
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

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
