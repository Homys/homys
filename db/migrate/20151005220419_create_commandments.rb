class CreateCommandments < ActiveRecord::Migration
  def change
    create_table :commandments do |t|
      t.string :title
      t.string :description
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
