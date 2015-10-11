class ChoreItemsController < ApplicationController

	before_action :authenticate_user!
	before_filter :ensureHouseExists


	def create
		@chore_item = ChoreItem.new(chore_item_params)
		@chore_item.owner_id = current_user.id

		respond_to do |format|
			if @chore_item.save
				format.html { redirect_to house_chore_items_path(current_user.house), notice: 'Chore added.' }
	      format.js {}

			else
				format.html { render :index, alert: 'There was an error.'  }
	      format.js {}
			end
		end
	end

	def index
		@chore_items = ChoreItem.all
		@chore_item = ChoreItem.new

		respond_to do |format|
			format.html
			format.js
		end
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
