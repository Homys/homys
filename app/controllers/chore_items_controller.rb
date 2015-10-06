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

	def show 
		@chore_item = ChoreItem.find(params[:id])
	end 

private 

	def chore_item_params
		params.require(:chore_item).permit(:name, :description, :user_id, :owner_id)
	end

end
