require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "MyString",
      :address => "MyString",
      :department => "MyString",
      :number_employees => 1,
      :industry => "MyString",
      :website => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_path(@company), "post" do
      assert_select "input#company_name[name=?]", "company[name]"
      assert_select "input#company_address[name=?]", "company[address]"
      assert_select "input#company_department[name=?]", "company[department]"
      assert_select "input#company_number_employees[name=?]", "company[number_employees]"
      assert_select "input#company_industry[name=?]", "company[industry]"
      assert_select "input#company_website[name=?]", "company[website]"
    end
  end
end
