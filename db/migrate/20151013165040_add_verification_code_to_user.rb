class AddVerificationCodeToUser < ActiveRecord::Migration
  def change
  	add_column :users, :verification_code, :string
  	add_column :users, :is_verified, :boolean
  end
end

