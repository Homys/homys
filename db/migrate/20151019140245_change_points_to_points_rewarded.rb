class ChangePointsToPointsRewarded < ActiveRecord::Migration
  def change
  	rename_column :chore_items, :points, :points_rewarded
  	rename_column :shopping_items, :points, :points_rewarded
  	add_column :expenses, :points_rewarded, :integer
  end
end
