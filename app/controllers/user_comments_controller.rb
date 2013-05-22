class UserCommentsController < ApplicationController

  before_filter :authorize



  # GET /companies/new
  # GET /companies/new.json

  def new
    @comment = UserComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end



  def create
    @comment = UserComment.new(params[:user_comment])
    @comment.user_id = current_user.id if current_user
    flash[:notice] = "UserComment was successfully created" if @comment.save

    redirect_to :action => 'show', :controller => 'internships', :id => @comment.internship_id

  end

  def update
    @comment = UserComment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:user_comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = UserComment.find(params[:id])
    @comment.destroy
    flash[:notice] = "UserComment was successfully deleted"
    redirect_to :action => 'show', :controller => 'internships', :id => @comment.internship_id

  end

end
