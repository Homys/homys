class RemoveUserIdFromExpenses < ActiveRecord::Migration
  def change
  	remove_column :expenses, :user_id
  end
end
