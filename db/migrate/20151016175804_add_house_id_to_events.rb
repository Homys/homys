class AddHouseIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :house_id, :integer
  end
end
