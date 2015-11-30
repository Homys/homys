class ShoppingItemsController < ApplicationController

	before_action :authenticate_user!, :ensure_house_exists, :get_house
	before_action :verified_phone, :if => :wants_sms?
	def create
		@shopping_item = ShoppingItem.new(shopping_item_params)
		@shopping_item.house = @house
		@shopping_item.owner = current_user
		@shopping_item.points_rewarded = 1000

		respond_to do |format|
			if @shopping_item.save
				format.html { redirect_to house_shopping_items_path(current_user.house), notice: 'New loot added.' }
	      format.js {}
			else
				format.html { render :index, alert: 'There was an error.'  }
	      format.js {render status: '422'}
			end
		end
	end

	def update
		@shopping_item = ShoppingItem.find(params[:id])
		@shopping_item.user = current_user
		@shopping_item.save

		redirect_to house_shopping_items_path(current_user.house)
	end

	def index
		@shopping_items = @house.shopping_items.order('importance DESC', 'created_at DESC').page(params[:page])
		@shopping_item = ShoppingItem.new

	end

	def destroy
		@shopping_item = ShoppingItem.find(params[:id])
		@shopping_item.destroy

		respond_to do |format|
      		format.html {redirect_to house_shopping_items_path(current_user.house)}
      		format.js
    	end

	end

	def bought_item
		@shopping_item = ShoppingItem.find(params[:shopping_item_id])
		current_user.total_points += @shopping_item.points_rewarded
		current_user.save
		@shopping_item.destroy
		redirect_to house_shopping_items_path(current_user.house), notice: "+#{@shopping_item.points_rewarded} points!"
	end

private

	def shopping_item_params
		params.require(:shopping_item).permit(:name, :importance, :points_rewarded, :owner_id, :user_id)
	end
end
