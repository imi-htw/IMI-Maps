class InternshipSearchesController < ApplicationController
  def new
    @internship_search = InternshipSearch.new
  end

  def create
    @internship_search = InternshipSearch.create!(params[:internship_search])
    binding.pry
    redirect_to @internship_search
  end

  def show
    @internship_search = InternshipSearch.find(params[:id])
  end
end
