class AddIndexToRestaurants < ActiveRecord::Migration
  def change
  	add_index :restaurants, :created_at
  end
end
