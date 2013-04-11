require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :name => "Name",
        :address => "Address",
        :department => "Department",
        :number_employees => 1,
        :industry => "Industry",
        :website => "Website"
      ),
      stub_model(Company,
        :name => "Name",
        :address => "Address",
        :department => "Department",
        :number_employees => 1,
        :industry => "Industry",
        :website => "Website"
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Department".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Industry".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
