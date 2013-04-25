require 'spec_helper'

describe "contact_people/edit" do
  before(:each) do
    @contact_person = assign(:contact_person, stub_model(ContactPerson,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit contact_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_person_path(@contact_person), "post" do
      assert_select "input#contact_person_first_name[name=?]", "contact_person[first_name]"
      assert_select "input#contact_person_last_name[name=?]", "contact_person[last_name]"
      assert_select "input#contact_person_email[name=?]", "contact_person[email]"
      assert_select "input#contact_person_phone[name=?]", "contact_person[phone]"
      assert_select "input#contact_person_company_id[name=?]", "contact_person[company_id]"
    end
  end
end
