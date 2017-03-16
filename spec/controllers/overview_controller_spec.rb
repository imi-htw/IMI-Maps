require 'rails_helper'

RSpec.describe OverviewController, :type => :controller do
  render_views


  before :each do
    @internship = create :internship, completed: true
    @current_user = login
  end

  describe "current user with invalid user_id" do
    it 'destroys the session' do
      session[:user_id] = 42
      expect {
        get :index
      }.to raise_error(NoMethodError)
    end
  end

  describe "GET #index" do
    it 'renders the index action correctly' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns @internships' do
      create :internship, completed: false

      get :index
      expect(assigns(:internships)).to eq([@internship])
    end

    it 'assigns @companies' do
      get :index
      expect(assigns(:companies)).to eq([@internship].map(&:company))
    end

    it 'assigns @programming_languages' do
      programming_language = create(:programming_language)
      @internship.programming_languages << programming_language

      get :index
      expect(assigns(:programming_languages)).to eq([programming_language])
    end

    it 'assigns @semesters' do
      get :index
      expect(assigns(:semesters)).to eq([@internship].map(&:semester))
    end

    it 'assigns @orientations' do
      get :index
      expect(assigns(:orientations)).to eq([[@internship.orientation.name, @internship.orientation.id]])
    end

    it 'assigns @countries' do
      get :index
      expect(assigns(:countries)).to eq([@internship.company.country])
    end
  end
end
