class ChangeColumnDefault < ActiveRecord::Migration
  def change
  	change_column :restaurants, :no_vote, :boolean, :default => false
  end
end
