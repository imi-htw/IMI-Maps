require 'rails_helper'

RSpec.describe QuicksearchesController, :type => :controller do
  render_views

  describe "GET index" do
    it 'renders the index template' do
      get :index, xhr: true, format: :js
      expect(response).to render_template(:index)
    end

    it 'performs the quicksearch' do
      @internship = create :internship, completed: true
      @programming_language_a = create :programming_language
      @programming_language_b = create :programming_language
      @internship.programming_languages << [@programming_language_a, @programming_language_b]

      get(:index, xhr: true, format: :js,
          semester: [@internship.semester.id.to_s],
          programming_language_ids: [@programming_language_a.id.to_s, @programming_language_b.id.to_s]
      )
      expect(response).to render_template(:index)

      @internship.company.website = "http://foo"
      @internship.company.save

      get(:index, xhr: true, format: :js,
          semester: [@internship.semester.id.to_s],
          programming_language_ids: [@programming_language_a.id.to_s, @programming_language_b.id.to_s]
      )
      expect(response).to render_template(:index)
    end
  end

end
