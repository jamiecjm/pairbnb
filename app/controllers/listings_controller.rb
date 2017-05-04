class ListingsController < ApplicationController
	before_action :find_listings, only: [:show]
	def index
	end

	def new
		@listing = Listing.new
		@taglink = Taglink.new
		render template: "listings/new"	
	end

	def create
		@listing = Listing.create(listings_from_params)
		@listing.update(user_id: current_user.id)
		params["listing"]["tag"].each do |key,value|
			next if value == "0"
			tag = Tag.find_by(name: key)
			Taglink.create(listing_id: @listing.id,tag_id: tag.id)
		end
		redirect_to listing_path(@listing)
	end

	def show
		session[:listing_id] = params[:id]
	end

	def search
		keyword = params[:search].titleize
	    @listings = Listing.where("city LIKE ?", "#{keyword}%")
	    @listings = Listing.all if params[:search] == ""
        respond_to do |format|
      		format.js 
        end 
	end

	def date
		@listing = Listing.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	private

	def find_listings
		@listing = Listing.find(params[:id])
	end

	def listings_from_params
	    params.require(:listing).permit(:name,:description,:country,:state,:city,:zipcode,:street,:place_type,:property_type,:guest_no,:room_no,:bed_no,:price,{avatars: []})
	end
end
