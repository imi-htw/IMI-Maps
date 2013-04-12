require 'spec_helper'

describe "internships/index" do
  before(:each) do
    assign(:internships, [
      stub_model(Internship,
        :orientation => "Orientation",
        :programming_language => "Programming Language",
        :salary => 1.5,
        :working_hours => 1.5,
        :living_costs => 1.5
      ),
      stub_model(Internship,
        :orientation => "Orientation",
        :programming_language => "Programming Language",
        :salary => 1.5,
        :working_hours => 1.5,
        :living_costs => 1.5
      )
    ])
  end

  it "renders a list of internships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Orientation".to_s, :count => 2
    assert_select "tr>td", :text => "Programming Language".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
