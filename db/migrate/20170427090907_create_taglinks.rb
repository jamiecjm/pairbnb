class CreateTaglinks < ActiveRecord::Migration[5.0]
  def change
    create_table :taglinks do |t|
    	t.integer	:listing_id
    	t.integer	:tag_id
      t.timestamps
    end
  end
end
