class SearchController < ApplicationController

  def index
  	@programming_languages = ProgrammingLanguage.order(:name).map do |p|
      [p.name, p.id]
    end
  end

end
