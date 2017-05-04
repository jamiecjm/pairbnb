class Changename < ActiveRecord::Migration[5.0]
  def change
  	remove_column :tags, :type
  	add_column	:tags, :tagtype, :string
  end
end
