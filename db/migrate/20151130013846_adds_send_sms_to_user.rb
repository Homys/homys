class AddsSendSmsToUser < ActiveRecord::Migration
  def change
    add_column :users, :send_sms, :boolean, default: false
  end
end
