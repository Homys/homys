class CreatePaymentStatuses < ActiveRecord::Migration
  def change
    rename_table :expenses_users, :payments
    add_column :payments, :paid, :boolean  
  end
end
