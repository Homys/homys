class ChoreItemsController < ApplicationController
	
	def new 
		@chore_item = ChoreItem.new
	end 

	def create 
		@chore_item = ChoreItem.new(chore_item_params)
	
		if @chore_item.save
			redirect_to chore_items_path
		else 
			render :new
		end 
	end 

	def index 
		@chore_items = ChoreItem.all 
	end 





	def run
		number_of_users = User.count 
		number_of_chores = ChoreItem.count 

		array_users = (1..number_of_users).to_a
		chore_user = array_users.sample


		@chore_item(user_id) = chore_user

		@chore_item.each do |chore|
			
			end  


		# max_num_chores_per_user = (number_of_chores / (number_of_users) + 1
			# @chore_item 


	end

private 

	def chore_item_params
		params.require(:chore_item).permit(:name, :description, :user_id, :owner_id)
	end

end
