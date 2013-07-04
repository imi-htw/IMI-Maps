class InternshipOfferController < ApplicationController
  before_filter :authorize

	def index
		@offers = InternshipOffer.all
	end

	def show
		@offer = InternshipOffer.find(params[:id])
	end
	
end