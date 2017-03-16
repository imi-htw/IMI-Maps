require 'rails_helper'

RSpec.describe FavoriteController, :type => :controller do
  render_views

  before :each do
    @current_user = login
    @internship = create :internship
    @favorite = create :favorite, internship: @internship
    @current_user.favorites << @favorite
  end

  describe "GET #index" do
    it 'assigns @favorites' do
      get :index
      expect(assigns(:favorites)).to eq([@current_user.favorites.first])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    it 'creates a new Favorite' do
      expect {
        post :create, xhr: true, format: :js,  internship_id: @internship.id, user_id: @current_user.id
      }.to change(Favorite, :count).by(1)
    end

    it 'renders the create template' do
      post :create, xhr: true, format: :js, internship_id: @internship.id, user_id: @current_user.id
      expect(response).to render_template(:create)
    end

    it 'assigns @current_user' do
      post :create, xhr: true, format: :js, internship_id: @internship.id, user_id: @current_user.id
      expect(assigns(:current_user)).to eq(@current_user)
    end

    it 'assigns @internship' do
      post :create, xhr: true, format: :js, internship_id: @internship.id, user_id: @current_user.id
      expect(assigns(:internship)).to eq(@internship)
    end
  end


  describe "DELETE #destroy" do
    it 'deletes a Favorite' do
      expect {
        delete :destroy, xhr: true, format: :js, id: @favorite.id
      }.to change(Favorite, :count).by(-1)
    end

    it 'assigns @current_user' do
      delete :destroy, xhr: true, format: :js, id: @favorite.id
      expect(assigns(:current_user)).to eq(@current_user)
    end

    it 'assigns @internship' do
      delete :destroy, xhr: true, format: :js, id: @favorite.id
      expect(assigns(:internship)).to eq(@internship)
    end

    it 'renders the destroy template' do
      delete :destroy, xhr: true, format: :js, id: @favorite.id
      expect(response).to render_template(:destroy)
    end

  end
end
