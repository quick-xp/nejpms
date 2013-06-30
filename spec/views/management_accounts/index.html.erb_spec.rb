require 'spec_helper'

describe "management_accounts/index" do
  before(:each) do
    assign(:management_accounts, [
      stub_model(ManagementAccount,
        :purchase_amount => "",
        :sales_amount => "",
        :inventory_amount => ""
      ),
      stub_model(ManagementAccount,
        :purchase_amount => "",
        :sales_amount => "",
        :inventory_amount => ""
      )
    ])
  end

  it "renders a list of management_accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
