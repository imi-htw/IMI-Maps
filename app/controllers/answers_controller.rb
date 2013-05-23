class AnswersController < ApplicationController
  before_filter :authorize

  def create
    @answer = Answer.new(params[:answer])
    @answer.user_id = current_user.id if current_user
    flash[:notice] = "Answer was successfully created" if @answer.save

    redirect_to :action => 'show', :controller => 'internships', :id => @answer.internship_id

  end

  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer was successfully deleted"
    redirect_to :action => 'show', :controller => 'internships', :id => @answer.internship_id

  end

end
