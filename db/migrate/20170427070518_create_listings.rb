class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
    	t.string  	:name
    	t.string  	:description
    	t.string	:country
    	t.string	:state
    	t.string	:city
    	t.integer	:zipcode
    	t.string	:street
    	t.integer  	:place_type
    	t.string  	:property_type
    	t.integer	:guest_no
    	t.integer	:room_no
    	t.integer	:bed_no
    	t.integer 	:price
    	t.integer 	:user_id
      t.timestamps
    end
  end
end
