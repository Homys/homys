class AddDefaultValueToPointsRewarded < ActiveRecord::Migration
  def change
  	change_column :chore_items, :points_rewarded, :integer, default: 1000
  	change_column :shopping_items, :points_rewarded, :integer, default: 1000
  	change_column :expenses, :points_rewarded, :integer, default: 1000
  end
end
