require 'rails_helper'

RSpec.describe FavoriteCompareController, :type => :controller do
  render_views

  describe "GET #index" do
    it 'assigns @internships' do
      @internship = create :internship

      get :index, format: :js, xhr: true
      expect(assigns(:internships)).to eq([])

      get :index, format: :js, xhr: true, favorite_ids: [@internship.id]
      expect(assigns(:internships)).to eq([@internship])
    end

    it 'renders the index template ' do
      get :index, format: :js, xhr: true
      expect(response).to render_template(:index)
    end
  end

end
