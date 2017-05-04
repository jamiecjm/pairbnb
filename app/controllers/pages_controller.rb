class PagesController < ApplicationController
	def index
		@listings = Listing.page params[:page]
	end
end
