class InternshipsController < ApplicationController
  respond_to :html, :json
  before_filter :get_programming_languages, :get_salaries, :only => [:new, :edit, :update, :create]
  # GET /internships
  # GET /internships.json
  def index
    @internships = Internship.search(params)
    respond_with(@internships)
  end

  # GET /internships/1
  # GET /internships/1.json
  def show
    @internship = Internship.find(params[:id])
    respond_with(@internship)
  end

  # GET /internships/new
  # GET /internships/new.json
  def new
    @internship = Internship.new
    respond_with(@internship)
    3.times { @internship.comments.build }
  end

  # GET /internships/1/edit
  def edit
    @internship = Internship.find(params[:id])
  end

  # POST /internships
  # POST /internships.json
  def create
    @internship = Internship.new(params[:internship])

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

  private

  def get_programming_languages
    @programming_languages = ProgrammingLanguage.order(:name).map do |p|
      [p.name, p.id]
    end
  end

  def get_salaries
    @salaries = Salary.order(:order_id).map do |s|
      [s.amount, s.id]
    end
  end

end
