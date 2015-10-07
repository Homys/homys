class CommandmentsController < ApplicationController

	def new
		@commandment = Commandment.new
	end

	def create
		@commandment = Commandment.new(commandment_params)
		@commandment.owner_id = current_user.id

		if @commandment.save
			redirect_to commandments_path
		else
			render :new
		end
	end

	def index
		@commandments = Commandment.all
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
