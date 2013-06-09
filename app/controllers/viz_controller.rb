class VizController < ApplicationController

	def countries
		countries = Company.all.collect do |x| x.country end
		countries_uniq = countries.uniq
		ary = Array.new
		countries_uniq.each do |x|
			ary << {:name=>x, :count=>countries.count(x)}
		end
		@data = ary

	end

	def languages
		@programming_languages = ProgrammingLanguage.all
		ary = Array.new
		@programming_languages.each do |x|
			s = x.internships.size
			if s > 0
				ary << {:name=>x.name, :count=>s}
			end
		end
		@data = ary
	end

	def orientation
		@orientations = Orientation.all
		ary = Array.new
		@orientations.each do |x|
			s = x.internships.size
			if s > 0
				ary << {:name=>x.name, :count=>s}
			end
		end
		@data = ary
	end

end