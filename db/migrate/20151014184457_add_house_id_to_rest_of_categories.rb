class AddHouseIdToRestOfCategories < ActiveRecord::Migration
  def change
    add_column :chore_items, :house_id, :integer
    add_column :commandments, :house_id, :integer
    add_column :expenses, :house_id, :integer
    add_column :announcements, :house_id, :integer
  end
end
