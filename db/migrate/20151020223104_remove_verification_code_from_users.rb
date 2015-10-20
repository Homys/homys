class RemoveVerificationCodeFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :verification_code
  end
end
