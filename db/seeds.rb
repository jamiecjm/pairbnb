# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

amenities = ["heating","kitchen","tv","wireless internet"]
facilities = ["elevator in building","Free parking on premises","pool","Wheelchair accessible"]
house_rules = ["pets allowed","smoking allowed","suitable for events"]
host_language = ["english","espanol","francais","italiano"]

amenities.each do |a|
	Tag.create(tagtype: "Amenities",name: a.capitalize)
end	

facilities.each do |a|
	Tag.create(tagtype: "Facilities",name: a.capitalize)
end	

house_rules.each do |a|
	Tag.create(tagtype: "House Rules",name: a.capitalize)
end	

host_language.each do |a|
	Tag.create(tagtype: "Host Language",name: a.capitalize)
end	
# Seed Users
user = {}
user['password'] = 'abc'
# user['password_confirmation'] = 'abc'

ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = (Faker::Name.first_name+" "+Faker::Name.last_name)
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['name'] = Faker::App.name
    listing['place_type'] = rand(0..2)
    # 1 - entire home, 2 - private room, 3 - shared room
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['room_no'] = rand(0..5)
    listing['bed_no'] = rand(1..6)
    listing['guest_no'] = rand(1..10)

    listing['country'] = Faker::Address.country
    listing['state'] = Faker::Address.state
    listing['city'] = Faker::Address.city
    listing['zipcode'] = Faker::Address.zip_code
    listing['street'] = Faker::Address.street_address

    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence

    listing['user_id'] = uids.sample
    new_listing = Listing.create(listing)
    rand(1..15).times do
    	Taglink.create(listing_id: new_listing.id,tag_id: rand(1..15))
    end
  end
end