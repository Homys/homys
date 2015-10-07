class CommandmentsController < ApplicationController

	def new 
		@commandment = Commandment.new
	end 

	def create 
		@commandment = Commandment.new(commandment_params)
	
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

private 

	def commandment_params
		params.require(:commandment).permit(:title, :description, :owner_id)
	end

end
