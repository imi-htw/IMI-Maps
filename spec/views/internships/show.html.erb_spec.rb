require 'spec_helper'

describe "internships/show" do
  before(:each) do
    @internship = assign(:internship, stub_model(Internship,
      :orientation => "Orientation",
      :programming_language => "Programming Language",
      :salary => 1.5,
      :working_hours => 1.5,
      :living_costs => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Orientation/)
    rendered.should match(/Programming Language/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
