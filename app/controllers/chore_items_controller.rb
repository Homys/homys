class ChoreItemsController < ApplicationController

	before_action :authenticate_user!
	def new
		@chore_item = ChoreItem.new
	end

	def create
		@chore_item = ChoreItem.new(chore_item_params)
		@chore_item.owner_id = current_user.id

		if @chore_item.save
			redirect_to house_chore_items_path(current_user.house_id)
		else
			render :new
		end
	end

	def index
		@chore_items = ChoreItem.all

		respond_to do |format|
			format.html
			format.js
		end
	end

	def show
		@chore_item = ChoreItem.find(params[:id])
	end

	def chore_assigner
		current_user.house.assign_chores

		redirect_to house_chore_items_path(current_user.house_id)
	end

	def destroy
		@chore_item = ChoreItem.find(params[:id])
		@chore_item.destroy
		redirect_to house_chore_items_path(current_user.house_id)
	end

private

	def chore_item_params
		params.require(:chore_item).permit(:name, :description, :user_id, :owner_id)
	end

end
