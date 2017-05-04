class Tag < ApplicationRecord
	has_many :listings, :through => :taglinks
	has_many :taglinks, dependent: :destroy

end
