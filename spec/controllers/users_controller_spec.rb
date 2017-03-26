require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  render_views

  before :each do
    @current_user = login
  end

  describe "GET #new" do
    it 'renders the new template' do
      session[:enrolment_number] = 42.to_s
      get :new
      expect(response).to render_template :new
    end

    it 'creates and assigns a new instance of UserCreationForm' do
      session[:enrolment_number] = 42.to_s
      get :new
      expect(assigns(:user_creation_form)).to be_an_instance_of(UserCreationForm)
    end
  end

  describe "POST #create" do
    it 'creates and assigns new instance of UserCreationForm' do
      session[:enrolment_number] = 42.to_s
      post :create, user_creation_form: attributes_for(:user)
      expect(assigns(:user_creation_form)).to be_an_instance_of(UserCreationForm)
    end

    context 'given correct parameters' do
      it 'should redirect ot overview#index' do
        session[:enrolment_number] = 42.to_s
        post :create, user_creation_form: attributes_for(:user, password: "foofoofoo", password_confirmation: "foofoofoo", first_name: "first name", last_name: "last name", birthday: "12.12.2005", birthplace: "foo")
        expect(response).to redirect_to overview_index_path
      end
    end
  end

  describe "GET #show" do
    it 'renders the show template' do
      get :show, id: @current_user
      expect(response).to render_template :show
    end

    it 'assigns @user' do
      get :show, id: @current_user
      expect(assigns(:user)).to eq @current_user
    end

    it 'assigns @internships' do
      get :show, id: @current_user
      expect(assigns(:internships)).to eq []
    end

    it 'assigns @comments' do
      get :show, id: @current_user
      expect(assigns(:comments)).to eq []
    end
  end

  describe "GET #edit" do
    it 'assigns @user' do
      get :edit, id: @current_user
      expect(assigns(:user)).to eq @current_user
    end
  end

  describe "PUT #update" do
    before :each do
      @user = create :user, email: "foo@bar.com"
    end

    it '"assigns @user"' do
      put :update, id: @current_user
      expect(assigns(:user)).to eq @current_user
    end

    context 'given correct parameters' do
      it 'updates the user' do
        put :update, id: @user, user: attributes_for(:user, email: "bar@foo.com")
        @user.reload
        expect(@user.email).to eq("bar@foo.com")
      end

      it 'redirects to the user show view' do
        put :update, id: @user, user: attributes_for(:user, email: "bar@foo.com")
        expect(response).to redirect_to @user
      end
    end

    context 'given incorrect parameters' do
      it 'refuses to updates the user' do
        put :update, id: @user, user: attributes_for(:user, email: nil)
        @user.reload
        expect(@user.email).to eq("foo@bar.com")
      end

      it 'redirects to the user show view' do
        put :update, id: @user, user: attributes_for(:user, email: nil)
        expect(response).to render_template :edit
      end
    end
  end
end
