require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "Name",
      :address => "Address",
      :department => "Department",
      :number_employees => 1,
      :industry => "Industry",
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/Department/)
    rendered.should match(/1/)
    rendered.should match(/Industry/)
    rendered.should match(/Website/)
  end
end
