require 'spec_helper'

describe "management_accounts/show" do
  before(:each) do
    @management_account = assign(:management_account, stub_model(ManagementAccount,
      :purchase_amount => "",
      :sales_amount => "",
      :inventory_amount => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
