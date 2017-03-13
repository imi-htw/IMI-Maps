require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET #new" do
    context 'when not logged in ' do
      it "returns http success" do
        create :internship, completed: true
        company = create :company, website: "http"
        create :internship, completed: true, company: company
        create :internship, completed: true, company: company
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    context 'when logged in' do
      it 'redirects to overview#index' do
        login
        get :new
        expect(response).to redirect_to(:overview_index)
      end
    end
  end

  describe "POST #create" do
    context 'without successful authentication' do
      it "redirects to :back" do
        request.env["HTTP_REFERER"] = '/'
        post :create
        expect(response).to redirect_to("/")
      end
    end

    context 'with successful authentication' do
      it "redirects to overview#index" do
        user = create :user, password: "foofoofoo", email: "foo@bar.com"
        post :create, email: user.email, password: "foofoofoo"
        expect(response).to redirect_to(:overview_index)
      end
    end
  end

  describe "GET #destroy" do
    it "redirects to root_url" do
      get :destroy
      expect(response).to redirect_to(:root)
    end
  end

end
