class AddDoneToChoreItem < ActiveRecord::Migration
  def change
  	add_column :chore_items, :done, :boolean
  end
end
