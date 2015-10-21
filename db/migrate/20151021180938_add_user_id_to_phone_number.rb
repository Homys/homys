class AddUserIdToPhoneNumber < ActiveRecord::Migration
  def change
  	add_column :phone_numbers, :user_id, :integer
  end
end
