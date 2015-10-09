class ShoppingItemsController < ApplicationController

	before_action :authenticate_user!
	before_filter :ensureHouseExists

	def new
		@shopping_item = ShoppingItem.new
	end

	def create
		@shopping_item = ShoppingItem.new(shopping_item_params)

		@shopping_item.owner_id = current_user.id

		if @shopping_item.save
			redirect_to house_shopping_items_path(current_user.house_id)
		else
			render :new
		end
	end

	def index
		@shopping_items = ShoppingItem.order('importance DESC', 'created_at DESC')

		respond_to do |format|
			format.html
			format.js
		end
	end

	def destroy
		@shopping_item = ShoppingItem.find(params[:id])
		@shopping_item.destroy
		redirect_to house_shopping_items_path(current_user.house_id)
	end

private

	def shopping_item_params
		params.require(:shopping_item).permit(:name, :importance, :points, :owner_id)
	end
end
