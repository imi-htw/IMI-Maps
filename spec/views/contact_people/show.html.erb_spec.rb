require 'spec_helper'

describe "contact_people/show" do
  before(:each) do
    @contact_person = assign(:contact_person, stub_model(ContactPerson,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => "Phone",
      :company_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/1/)
  end
end
