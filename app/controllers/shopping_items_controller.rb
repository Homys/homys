class ShoppingItemsController < ApplicationController
	def new 
		@shopping_item = ShoppingItem.new
	end 

	def create 
		@shopping_item = ShoppingItem.new(shopping_item_params)
	
		if @shopping_item.save
			redirect_to shopping_items_path
		else 
			render :new
		end 
	end 

	def index 
		@shopping_items = ShoppingItem.all 
	end 

private 

	def shopping_item_params
		params.require(:shopping_item).permit(:name, :importance, :points, :owner_id)
	end
end
