class AddColumn < ActiveRecord::Migration[5.0]
  def change
  	create_table :tags do |t|
  		t.string	:name
  		t.string	:type
  	end
  end

end
