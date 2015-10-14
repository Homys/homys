class ShoppingItemsController < ApplicationController

	before_action :authenticate_user!, :ensureHouseExists, :get_house


	def create
		@shopping_item = ShoppingItem.new(shopping_item_params)
		@shopping_item.house = @house
		@shopping_item.owner = current_user

		respond_to do |format|
			if @shopping_item.save
				format.html { redirect_to house_shopping_items_path(current_user.house), notice: 'New loot added.' }
	      format.js {}

			else
				format.html { render :index, alert: 'There was an error.'  }
	      format.js {}
			end
		end
	end

	def index
		@shopping_items = @house.shopping_items.order('importance DESC', 'created_at DESC')
		@shopping_item = ShoppingItem.new
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
