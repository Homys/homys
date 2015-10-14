class AddHouseIdToShoppingItems < ActiveRecord::Migration
  def change
    add_column :shopping_items, :house_id, :integer
  end
end
