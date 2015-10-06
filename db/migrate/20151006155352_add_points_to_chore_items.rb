class AddPointsToChoreItems < ActiveRecord::Migration
  def change
  	add_column :chore_items, :points, :integer
  end
end
