module ListingsHelper
	
	def place_type(listing)
		case listing.place_type
		when 1
		"Entire home"
		when 2
		"Private room"
		when 3
		"Shared room"
		end
	end

	def bed_no(listing)
		bed_no = listing.bed_no
		if bed_no == 1
			"1 bed"
		else
			"#{bed_no} beds"
		end
	end

	def guest_no(listing)
		guest_no = listing.guest_no
		if guest_no == 1
			"1 guest"
		else
			"#{guest_no} guests"
		end
	end

	def room_no(listing)
		room_no = listing.room_no
		if room_no == 1
			"1 room"
		else
			"#{room_no} rooms"
		end
	end
end
