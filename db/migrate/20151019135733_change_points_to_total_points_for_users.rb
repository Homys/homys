class ChangePointsToTotalPointsForUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :points, :total_points
  end
end
