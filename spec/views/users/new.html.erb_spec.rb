require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :last_name => "MyString",
      :first_name => "MyString",
      :major => "MyString",
      :email => "MyString",
      :role => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_last_name[name=?]", "user[last_name]"
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_major[name=?]", "user[major]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_role[name=?]", "user[role]"
    end
  end
end
