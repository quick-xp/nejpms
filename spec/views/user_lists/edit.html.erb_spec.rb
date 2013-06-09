require 'spec_helper'

describe "user_lists/edit" do
  before(:each) do
    @user_list = assign(:user_list, stub_model(UserList,
      :user_id => "",
      :user_name => "MyString"
    ))
  end

  it "renders the edit user_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_list_path(@user_list), "post" do
      assert_select "input#user_list_user_id[name=?]", "user_list[user_id]"
      assert_select "input#user_list_user_name[name=?]", "user_list[user_name]"
    end
  end
end
