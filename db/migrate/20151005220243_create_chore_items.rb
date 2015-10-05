class CreateChoreItems < ActiveRecord::Migration
  def change
    create_table :chore_items do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
