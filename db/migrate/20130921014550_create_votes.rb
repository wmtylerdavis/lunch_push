class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.boolean :up_vote, :default => false

      t.timestamps
    end
    add_index :votes, [:user_id, :restaurant_id]
  end
end
