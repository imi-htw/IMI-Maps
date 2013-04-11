require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :last_name => "Last Name",
        :first_name => "First Name",
        :major => "Major",
        :email => "Email",
        :role => "Role"
      ),
      stub_model(User,
        :last_name => "Last Name",
        :first_name => "First Name",
        :major => "Major",
        :email => "Email",
        :role => "Role"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Major".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
