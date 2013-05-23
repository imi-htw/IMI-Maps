class SearchController < ApplicationController
  before_filter :authorize

  def index
  	@programming_languages = ProgrammingLanguage.order(:name).map do |p|
      [p.name, p.id]
    end
  end

end
