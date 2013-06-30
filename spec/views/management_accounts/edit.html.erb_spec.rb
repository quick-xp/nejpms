require 'spec_helper'

describe "management_accounts/edit" do
  before(:each) do
    @management_account = assign(:management_account, stub_model(ManagementAccount,
      :purchase_amount => "",
      :sales_amount => "",
      :inventory_amount => ""
    ))
  end

  it "renders the edit management_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", management_account_path(@management_account), "post" do
      assert_select "input#management_account_purchase_amount[name=?]", "management_account[purchase_amount]"
      assert_select "input#management_account_sales_amount[name=?]", "management_account[sales_amount]"
      assert_select "input#management_account_inventory_amount[name=?]", "management_account[inventory_amount]"
    end
  end
end
