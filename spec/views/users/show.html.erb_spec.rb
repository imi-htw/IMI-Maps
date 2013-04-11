require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :last_name => "Last Name",
      :first_name => "First Name",
      :major => "Major",
      :email => "Email",
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    rendered.should match(/First Name/)
    rendered.should match(/Major/)
    rendered.should match(/Email/)
    rendered.should match(/Role/)
  end
end
