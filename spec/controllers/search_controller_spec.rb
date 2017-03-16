require 'rails_helper'

RSpec.describe SearchController, :type => :controller do
  render_views

  before :each do
    @current_user = login
    @internship = create :internship
    @internship.programming_languages << create(:programming_language)
  end

  describe "GET index" do
    it 'should run the index method' do
      get :index
      expect(response).to be_truthy
    end
  end
end
