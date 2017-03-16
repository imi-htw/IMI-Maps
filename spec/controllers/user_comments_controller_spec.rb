require 'rails_helper'

RSpec.describe UserCommentsController, :type => :controller do
  render_views

  before :each do
    @current_user = login
  end

  describe "GET #new" do

    it 'assigns @comment' do
      get :new, xhr: true, format: :js
      expect(assigns(:comment)).to be_a_new(UserComment)
    end
  end

  describe "POST #create" do
    before :each do
      @internship = create :internship
      #@internship.student.user = create(:user)
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
      expect(assigns(:user_comments)).to eq([@internship.user_comments.first])
    end

    it 'assigns @new_comment' do
      post :create, xhr: true, user_comment: attributes_for(:user_comment, internship_id: @internship)
      expect(assigns(:new_comment)).to be_a_new(UserComment)
    end


  end

  describe "PUT #update" do
    before :each do
      @user_comment = create :user_comment, body: "Foo"
    end

    it 'assigns @comment' do
      put :update, id: @user_comment
      expect(assigns(:comment)).to eq(@user_comment)
    end

    context 'given correct parameters' do
      it 'updates the user_comment' do
        put :update, id: @user_comment, user_comment: attributes_for(:user_comment, body: "Bar")
        @user_comment.reload
        expect(@user_comment.body).to eq("Bar")
      end
    end

    context 'given incorrect parameters' do
      it 'refuses ot update the user_comment' do
        put :update, xhr: true, format: :js, id: @user_comment, user_comment: attributes_for(:user_comment, body: nil)
        @user_comment.reload
        expect(@user_comment.body).to eq("Foo")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @user_comment = create :user_comment, body: "Foo"
    end

    it 'assigns @comment' do
      delete :destroy, xhr: true, format: :js, id: @user_comment
      expect(assigns(:comment)).to eq(@user_comment)
    end

    it 'renders the delete template' do
      delete :destroy, xhr: true, format: :js, id: @user_comment
      expect(response).to render_template(:destroy)
    end

    it 'assigns @internship' do
      delete :destroy, id: @user_comment
      expect(assigns(:internship)).to eq(@user_comment.internship)
    end

    it 'assigns @user_comments' do
      delete :destroy, id: @user_comment
      expect(assigns(:user_comments)).to eq([])
    end
  end

end
