class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :website
      t.integer :vote_count
      t.boolean :no_vote
      t.integer :lunch_id

      t.timestamps
    end
    add_index :restaurants, [:lunch_id, :vote_count]
  end
end
