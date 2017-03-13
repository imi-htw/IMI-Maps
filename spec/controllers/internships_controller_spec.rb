require 'rails_helper'

RSpec.describe InternshipsController, :type => :controller do
  render_views

  before :each do
    @current_user = login
  end

  describe "GET #index" do
    it 'renders the index action correctly' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    context 'assignments' do
      before :each do
        @internship = create :internship, completed: true, living_costs: 42, salary: 84
      end

      it 'assigns @internships' do
        get :index
        expect(assigns(:internships)).to eq([@internship])
      end

      it 'assigns @current_user' do
        get :index
        expect(assigns(:current_user)).to eq @current_user
      end

      it 'assigns @companies' do
        get :index
        expect(assigns(:companies)).to eq([@internship.company])
      end

      it 'assigns @countries' do
        get :index
        expect(assigns(:countries)).to eq([@internship.company.country])
      end

      it 'assigns @semesters' do
        get :index
        expect(assigns(:semesters)).to eq([[@internship.semester.name, @internship.semester.id]])
      end

      it 'assigns @orientations' do
        get :index
        expect(assigns(:orientations)).to eq([[@internship.orientation.name, @internship.orientation.id]])
      end

      it 'assigns @living_costs_max' do
        get :index
        expect(assigns(:living_costs_max)).to eq(42)
      end

      it 'assigns @salary_max' do
        get :index
        expect(assigns(:salary_max)).to eq(84)
      end

      it 'assigns @internships differently with progamming_language_ids' do
        programming_language_a = create(:programming_language)
        programming_language_b = create(:programming_language)

        @internship.programming_languages << programming_language_a

        @internship_1 = create :internship, completed: true
        @internship_1.programming_languages << programming_language_b

        get :index, programming_language_ids: [programming_language_a.id, programming_language_b.id]
        expect(assigns(:internships)).to eq([])
      end
    end

  end

  describe "GET #show" do
    before :each do
      @internship = create :internship, completed: true
    end

    it 'renders the show action correctly' do
      get :show, id: @internship
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end

    context 'assignments' do

      it 'assigns @internship' do
        get :show, id: @internship
        expect(assigns(:internship)).to eq(@internship)
      end

      it 'assigns @favorite' do
        favorite = create :favorite, internship_id: @internship.id, user_id: @current_user.id
        get :show, id: @internship
        expect(assigns(:favorite)).to eq(favorite)
      end

      it 'assigns @other_internships correctly' do
        get :show, id: @internship
        expect(assigns(:other_internships)).to eq([])
      end

      it 'assigns @user_comments correctly' do

        #user_comment = create :user_comment, internship: @internship
        #@internship.user_comments << user_comment
        get :show, id: @internship
        expect(assigns(:user_comments)).to eq([])
      end
    end
  end

  describe "GET #edit" do
    before :each do
      @internship = create :internship, student: @current_user.student
    end

    it 'renders the edit action correctly' do
      get :edit, id: @internship
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end

    context 'assignments' do
      it 'assigns @internship' do
        get :edit, id: @internship
        expect(assigns(:internship)).to eq(@internship)
      end

      it 'assigns @company' do
        get :edit, id: @internship
        expect(assigns(:company)).to eq(@internship.company)
      end

      it 'assigns @rating' do
        get :edit, id: @internship
        expect(assigns(:rating)).to eq(@internship.internship_rating)
      end
    end

  end

  describe "PUT #update" do
    before :each do
      @internship = create :internship, student: @current_user.student, title: "Foo"
    end

    context 'given correct parameters' do
      it 'updates the specified Internship' do
        put :update, id: @internship, internship: attributes_for(:internship, title: "Bar")
        @internship.reload
        expect(@internship.title).to eq("Bar")
      end
    end

    context 'given incorrect parameters' do
      it 'refuses to update the specified Internship' do
        semester_id = @internship.semester_id
        put :update, id: @internship, internship: attributes_for(:internship, semester_id: nil)
        @internship.reload
        expect(@internship.semester_id).to eq(semester_id)
      end
    end
  end

  describe "DELETE #destroy" do
    it 'destroys the specified internship' do
      @internship = create :internship, student: @current_user.student
      expect {
        delete :destroy, id: @internship.id
      }.to change(Internship, :count).by(-1)
    end
  end

  describe "private #authorize_internship" do

    context 'the user is not associated to the internship' do
      it 'redirects to overview_index' do
        @internship = create :internship
        get :edit, id: @internship
        expect(response).to redirect_to(:overview_index)
      end
    end

    context 'the internship can not be found' do
      it 'redirects to overview_index' do
        get :edit, id: 42
        expect(response).to redirect_to(:overview_index)
      end
    end
  end
end
