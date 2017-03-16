require 'rails_helper'

RSpec.describe UserVerificationsController, :type => :controller do
  render_views

  describe "GET #new" do
    it 'renders the new template' do
      get :new, xhr: true, format: :js
      expect(response).to render_template :new
    end
  end
end
