class AnswersController < ApplicationController
  
  # GET /companies/1
  # GET /companies/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @answer = Answer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /companies/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @answer = Answer.new(params[:answer])
    @answer.user_id = current_user.id if current_user
    flash[:notice] = "Answer was successfully created" if @answer.save

    redirect_to :action => 'show', :controller => 'internships', :id => @answer.internship_id

  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer was successfully deleted"
    redirect_to :action => 'show', :controller => 'internships', :id => @answer.internship_id

  end

end
