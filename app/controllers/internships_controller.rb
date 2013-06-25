class InternshipsController < ApplicationController
  respond_to :html, :json
  before_filter :get_programming_languages, :get_orientations, :only => [:new, :edit, :update, :create]
  before_filter :authorize
  # GET /internships
  # GET /internships.json
  def index
    @internships = Internship.includes(:company)
    @current_user = User.find(current_user.id)

    orientations = params[:orientation].collect{|s| s.to_i} if params[:orientation].present?
    semesters = params[:semester].collect{|s| s.to_i} if params[:semester].present?

    if params[:programming_language_ids].present?
        internships_ary = []
        languages = params[:programming_language_ids].collect{|s| s.to_i} if params[:programming_language_ids].present?
        programming_languages = ProgrammingLanguage.find(languages)
        programming_languages.each do |x|
          if internships_ary.empty?
            internships_ary = x.internships.collect do |s| s.id end
          else
            internships_ary = internships_ary & x.internships.collect do |s| s.id end
          end
        end
        @internships = @internships.where(:id => internships_ary)
      end

    @internships = @internships.where(:companies => {:country => params[:country]}) if params[:country].present?
    @internships = @internships.where(:orientation_id => orientations) if orientations.present?
    @internships = @internships.where(:semester_id => semesters) if semesters.present?

    @country_choices = params[:country] if params[:country].present?
    @semester_choices = params[:semester] if params[:semester].present?
    @orientation_choices = params[:orientation] if params[:orientation].present?
    @language_choices = params[:programming_language_ids] if params[:programming_language_ids].present?

    #@internships = @internships.where('working_hours <= ?',params[:working_hours])
    @internships = @internships.where('living_costs <= ?',params[:living_costs])
    #@internships = @internships.where('rating >= ?',params[:rating])
    @internships = @internships.where('salary >= ?',params[:salary])

    @salary = params[:salary]
    @living_costs = params[:living_costs]

    @internshipsAll = Internship.all

    @companies = @internshipsAll.collect do |x| x.company end

    @countries = @companies.collect do |x| x.country end.uniq

    @programming_languages = ProgrammingLanguage.order(:name).where(:id => (Internship.joins(:programming_languages).select(:programming_language_id).collect do |x| x.programming_language_id end).uniq).map do |p|
        [p.name, p.id]
      end

    @semesters = Semester.where(:id =>(@internshipsAll.collect do |x| x.semester_id end.uniq)).map do |s| [s.semester, s.id] end

    @orientations = (Orientation.where(:id => @internshipsAll.collect do |x| x.orientation_id end)).uniq.map do |o| [o.name, o.id] end

    @living_costs_max = @internshipsAll.collect do |x| x.living_costs end.max

    @salary_max = @internshipsAll.collect do |x| x.salary end.max

    @internships_size = @internships.size

    @internships = @internships.page params[:page]

    respond_with(@internships)
  end

  # GET /internships/1
  # GET /internships/1.json
  def show
    @internship = Internship.find(params[:id])
    @comment = UserComment.new
    @answer = Answer.new
    @favorite = Favorite.where(:internship_id => @internship.id, :user_id => current_user.id)[0]
    @user_comments = @internship.user_comments.order("created_at DESC")

    @pins = @internship.company.to_gmaps4rails do |company, marker |

      href =  if company.website.starts_with?'http' 
              company.website  
            else 
              "http://"+company.website 
             end
             
      marker.infowindow ("<a href='/companies/#{company.id}' style='font-weight:bold'>#{company.name}</a><p>Industry: #{company.industry}</p><p>Employees: #{company.number_employees}</p><a href='#{href}' target='_blank'>#{company.website}</a>")

    end
    
    respond_with(@internship)
  end

  # GET /internships/new
  # GET /internships/new.json
  def new
    if User.find(current_user.id).internship_authorization
      @internship = Internship.new
      @company = Company.new
      respond_with(@internship)
    else
      flash[:notice] = "You cannot create an internship"
      redirect_to internships_url
    end
  end

  # GET /internships/1/edit
  def edit
    @internship = Internship.find(params[:id])
    @company = @internship.company
  end

  # POST /internships
  # POST /internships.json
  def create
    @user = User.find(current_user.id)
    if @user.internship_authorization
      @company = Company.new(params[:company])
      @company.save
      @internship = Internship.new(params[:internship])
      @internship.company_id = @company.id
      @internship.user_id = current_user.id if current_user
      @user.internship_authorization = false
      @user.save
      if (@user.mailnotif == true)
        UserMailer.create_internship_confirmation(@user).deliver
      end
      flash[:notice] = "Internship was successfully created" if @internship.save
      respond_with(@internship)
    else
      flash[:notice] = "You cannot create an internship"
      redirect_to internships_url
    end
  end

  # PUT /internships/1
  # PUT /internships/1.json
  def update
    @internship = Internship.find(params[:id])

    if @internship.update_attributes(params[:internship])
      flash[:notice] = 'Internship was successfully updated.'
    end
    respond_with(@internship)
  end

  # DELETE /internships/1
  # DELETE /internships/1.json
  def destroy
    @internship = Internship.find(params[:id])
    @internship.destroy

    respond_to do |format|
      format.html { redirect_to internships_url }
      format.json { head :no_content }
    end
  end

end
