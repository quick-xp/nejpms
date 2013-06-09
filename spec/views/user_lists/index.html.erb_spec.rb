require 'spec_helper'

describe "user_lists/index" do
  before(:each) do
    assign(:user_lists, [
      stub_model(UserList,
        :user_id => "",
        :user_name => "User Name"
      ),
      stub_model(UserList,
        :user_id => "",
        :user_name => "User Name"
      )
    ])
  end

  it "renders a list of user_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
  end
end
