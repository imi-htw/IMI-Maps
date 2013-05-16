class InternshipsController < ApplicationController
  respond_to :html, :json
  before_filter :get_programming_languages, :get_salaries, :only => [:new, :edit, :update, :create]
  # GET /internships
  # GET /internships.json
  def index
    @internships = Internship.all
    respond_with(@internships)
  end

  # GET /internships/1
  # GET /internships/1.json
  def show
    @internship = Internship.find(params[:id])
    @comment = Comment.new
    @answer = Answer.new
    
    respond_with(@internship)
  end

  # GET /internships/new
  # GET /internships/new.json
  def new
    @internship = Internship.new
    respond_with(@internship)
  end

  # GET /internships/1/edit
  def edit
    @internship = Internship.find(params[:id])
  end

  # POST /internships
  # POST /internships.json
  def create
    @internship = Internship.new(params[:internship])
    @internship.user_id = current_user.id if current_user
    flash[:notice] = "Internship was successfully created" if @internship.save
    respond_with(@internship)
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
