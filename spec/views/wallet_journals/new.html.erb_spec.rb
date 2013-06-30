require 'spec_helper'

describe "wallet_journals/new" do
  before(:each) do
    assign(:wallet_journal, stub_model(WalletJournal,
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
    ).as_new_record)
  end

  it "renders new wallet_journal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wallet_journals_path, "post" do
      assert_select "input#wallet_journal_transaction_id[name=?]", "wallet_journal[transaction_id]"
      assert_select "input#wallet_journal_transaction_date_time[name=?]", "wallet_journal[transaction_date_time]"
      assert_select "input#wallet_journal_transaction_type_id[name=?]", "wallet_journal[transaction_type_id]"
      assert_select "input#wallet_journal_owner_name1[name=?]", "wallet_journal[owner_name1]"
      assert_select "input#wallet_journal_owner_id1[name=?]", "wallet_journal[owner_id1]"
      assert_select "input#wallet_journal_owner_name2[name=?]", "wallet_journal[owner_name2]"
      assert_select "input#wallet_journal_owner_id2[name=?]", "wallet_journal[owner_id2]"
      assert_select "input#wallet_journal_arg_name1[name=?]", "wallet_journal[arg_name1]"
      assert_select "input#wallet_journal_arg_id1[name=?]", "wallet_journal[arg_id1]"
      assert_select "input#wallet_journal_amount[name=?]", "wallet_journal[amount]"
      assert_select "input#wallet_journal_balance[name=?]", "wallet_journal[balance]"
      assert_select "input#wallet_journal_reason[name=?]", "wallet_journal[reason]"
      assert_select "input#wallet_journal_tax_receiver_id[name=?]", "wallet_journal[tax_receiver_id]"
      assert_select "input#wallet_journal_tax_amount[name=?]", "wallet_journal[tax_amount]"
    end
  end
end
