require 'rails_helper'

RSpec.describe InternshipOfferController, :type => :controller do
  render_views

  before :each do
    @current_user = login
    @internship_offer = create :internship_offer
  end

  describe "GET #index" do
    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'assigns @offers' do
      get :index
      expect(assigns(:offers)).to eq([@internship_offer])
    end
  end

  describe "GET #show" do
    it 'renders the show template' do
      get :show, id: @internship_offer
      expect(response).to render_template :show
    end

    it 'assigns @show' do
      get :show, id: @internship_offer
      expect(assigns(:offer)).to eq(@internship_offer)
    end
  end

end
