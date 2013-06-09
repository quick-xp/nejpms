require 'spec_helper'

describe "user_lists/show" do
  before(:each) do
    @user_list = assign(:user_list, stub_model(UserList,
      :user_id => "",
      :user_name => "User Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/User Name/)
  end
end
