class CommandmentsController < ApplicationController

	before_action :authenticate_user!, :ensure_house_exists, :get_house

	def create
		@commandment = Commandment.new(commandment_params)
		@commandment.owner_id = current_user.id

		respond_to do |format|
			if @commandment.save
				format.html { redirect_to house_commandments_path(current_user.house), notice: 'Commandment added.' }
	      format.js {}

			else
				format.html { render :index, alert: 'There was an error.'  }
	      format.js {}
			end
		end
	end

	def index
		@commandments = Commandment.all
		@commandment = Commandment.new
	end

	def show
		@commandment = Commandment.find(params[:id])
	end

	def destroy
		@commandment = Commandment.find(params[:id])
		@commandment.destroy
		redirect_to house_commandments_path(current_user.house)
	end

private

	def commandment_params
		params.require(:commandment).permit(:title, :description, :owner_id)
	end

end
