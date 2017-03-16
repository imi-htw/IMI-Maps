require 'rails_helper'

RSpec.describe UserCommentsController, :type => :controller do
  render_views

  before :each do
    @current_user = login
  end

  describe "GET #new" do
    #it 'renders the new template' do
      #get :new, xhr: true, format: :js
      #expect(response).to render_template :new
    #end

    it 'assigns @comment' do
      get :new, xhr: true, format: :js
      expect(assigns(:comment)).to be_a_new(UserComment)
    end
  end

  describe "POST #create" do
    before :each do
      @internship = create :internship
      @internship.student.user = create(:user)
    end

    it 'creates a new UserComment' do
      expect {
        post :create, xhr: true, user_comment: attributes_for(:user_comment, internship_id: @internship)
      }.to change(UserComment, :count).by(1)
    end

    it 'assigns @answer' do
      post :create, xhr: true, user_comment: attributes_for(:user_comment, internship_id: @internship)
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'assigns @user_comments' do
      post :create, xhr: true, user_comment: attributes_for(:user_comment, internship_id: @internship)
      expect(assigns(:user_comments)).to eq([])
    end

    it 'assigns @new_comment' do
      post :create, xhr: true, user_comment: attributes_for(:user_comment, internship_id: @internship)
      expect(assigns(:new_comment)).to be_a_new(UserComment)
    end


  end

  describe "PUT #update" do

  end

  describe "DELETE #destroy" do

  end

end
