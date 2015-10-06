class AddPointsToShoppingItem < ActiveRecord::Migration
  def change
  	add_column :shopping_items, :points, :integer
  end
end
