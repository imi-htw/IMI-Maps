require 'spec_helper'

describe "companies/new" do
  before(:each) do
    assign(:company, stub_model(Company,
      :name => "MyString",
      :street => "MyString",
      :ZIP => 11234,
      :city => "MyString",
      :country => "MyString",
      :number_employees => 1,
      :industry => "MyString",
      :main_language => "My String",
      :website => "MyString"
    ).as_new_record)
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", companies_path, "post" do
      assert_select "input#company_name[name=?]", "company[name]"
      assert_select "input#company_street[name=?]", "company[street]"
      assert_select "input#company_zip[name=?]", "company[zip]"
      assert_select "input#company_city[name=?]", "company[city]"
      assert_select "input#company_country[name=?]", "company[country]"
      assert_select "input#company_number_employees[name=?]", "company[number_employees]"
      assert_select "input#company_industry[name=?]", "company[industry]"
      assert_select "input#company_main_language[name=?]", "company[main_language]"
      assert_select "input#company_website[name=?]", "company[website]"
    end
  end
end
