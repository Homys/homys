class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title
      t.float :amount
      t.datetime :date_due
      t.integer :user_id
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
