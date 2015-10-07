class House < ActiveRecord::Base
  has_many :users
  has_many :created_chores, through: :users

	def assign_chores
  	created_chores.each do |chore|
  		chore.user = users.sample
  		chore.save
  	end
  end

end