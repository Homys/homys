class CreateShoppingItems < ActiveRecord::Migration
  def change
    create_table :shopping_items do |t|
      t.string :name
      t.string :importance
      t.integer :user_id
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
