require 'spec_helper'

describe "management_accounts/new" do
  before(:each) do
    assign(:management_account, stub_model(ManagementAccount,
      :purchase_amount => "",
      :sales_amount => "",
      :inventory_amount => ""
    ).as_new_record)
  end

  it "renders new management_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", management_accounts_path, "post" do
      assert_select "input#management_account_purchase_amount[name=?]", "management_account[purchase_amount]"
      assert_select "input#management_account_sales_amount[name=?]", "management_account[sales_amount]"
      assert_select "input#management_account_inventory_amount[name=?]", "management_account[inventory_amount]"
    end
  end
end
