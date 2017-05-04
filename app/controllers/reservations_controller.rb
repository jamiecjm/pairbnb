class ReservationsController < ApplicationController

	def create
		if !signed_in?
			redirect_to sign_in_path
			flash[:info] = "Please log in before booking"
		else
			@reserve = Reservation.new(reservation_from_param)
			@reserve.save
			@reserve.update_columns(user_id: current_user.id)
			@listing = Listing.find(session[:listing_id])
			flash[:success] = "Congratulations! Your booking is succcesful!"
			redirect_to listing_path(@listing)
		end
	end

	def reservation_from_param
		params.require(:reservation).permit(:start_date,:end_date,:listing_id)
	end
end
