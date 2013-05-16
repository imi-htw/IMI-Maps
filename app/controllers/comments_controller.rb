class CommentsController < ApplicationController

  before_filter :signed_in_user

  # GET /companies
  # GET /companies.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /companies/new
  # GET /companies/new.json

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id if current_user
    flash[:notice] = "Comment was successfully created" if @comment.save

    redirect_to :action => 'show', :controller => 'internships', :id => @comment.internship_id

  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment was successfully deleted"
    redirect_to :action => 'show', :controller => 'internships', :id => @comment.internship_id

  end

end
