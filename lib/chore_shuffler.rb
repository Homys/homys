class ChoreShuffler < ActionController::Base
	def run
		number_of_users = User.count 
		number_of_chores = ChoreItem.count

		ChoreItem.all.each do |chore|
			array_users = (1..number_users).to_a
			chore.user_id = array_users.sample

			# num_chores_per_person = (number_of_chores / number_of_users)
		end
	end

end