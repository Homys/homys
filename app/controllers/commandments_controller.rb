class CommandmentsController < ApplicationController
	before_action :authenticate_user!
	def new
		@commandment = Commandment.new
	end

	def create
		@commandment = Commandment.new(commandment_params)
		@commandment.owner_id = current_user.id

		if @commandment.save
			redirect_to house_commandments_path(current_user.house_id)
		else
			render :new
		end
	end

	def index
		@commandments = Commandment.all

		respond_to do |format|
			format.html
			format.js
		end
	end

	def show
		@commandment = Commandment.find(params[:id])
	end

	def destroy
		@commandment = Commandment.find(params[:id])
		@commandment.destroy
		redirect_to commandments_path
	end

private

	def commandment_params
		params.require(:commandment).permit(:title, :description, :owner_id)
	end

end
