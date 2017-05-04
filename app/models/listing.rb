class Listing < ApplicationRecord
	mount_uploaders :avatars, AvatarUploader

	attr_accessor :tag
	belongs_to :user
	has_many :taglinks, dependent: :destroy
	has_many :tags, :through => :taglinks
	has_many :reservations, dependent: :destroy

	enum place_type: ["Entire home","Private room","Shared room"]

	def booked_dates
		booked = []
		self.reservations.each do |reserve|
			booked<<(reserve.start_date..reserve.end_date).map(&:to_s)
		end
		booked.flatten.uniq
	end
end
