require 'rails_helper'

RSpec.describe AnswersController, :type => :controller do
  render_views

  before :each do
    @current_user = login
    @answer = create :answer, body: "foo"
  end

  describe "POST #create" do
    it 'creates a new Answer' do
      user_comment = create :user_comment
      expect {
        post :create, answer: attributes_for(:answer, user_comment_id: user_comment.id, internship_id: user_comment.internship_id)
      }.to change(Answer, :count).by(1)
    end
  end

  describe "PUT #update" do
    context 'with valid parameters' do
      it 'locates the requested answer' do
        put :update, id: @answer, answer: attributes_for(:answer)
        expect(assigns(:answer)).to eq(@answer)
      end

      it 'updates the answer' do
        put :update, id: @answer, answer: attributes_for(:answer, body: "Bar")
        @answer.reload
        expect(@answer.body).to eq("Bar")
      end
    end

    context 'with an invalid parameters' do
      it 'refuses to update the answer' do
        put :update, xhr: true, id: @answer, answer: attributes_for(:answer, body: ""), format: :js
        @answer.reload
        expect(@answer.body).to eq("foo")
      end
    end

    describe "DELETE #destroy" do
      it 'destroys the specified answer' do
        expect {
          delete :destroy, id: @answer.id
        }.to change(Answer, :count).by(-1)
      end
    end
  end
end
