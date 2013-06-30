require 'spec_helper'

describe "wallet_journals/show" do
  before(:each) do
    @wallet_journal = assign(:wallet_journal, stub_model(WalletJournal,
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
  end
end
