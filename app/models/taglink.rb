class Taglink < ApplicationRecord
	belongs_to :listing
	belongs_to :tag

	validates :tag_id, uniqueness: {:scope => :listing}
end
