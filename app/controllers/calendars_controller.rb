class CalendarsController < ApplicationController

	def new 
		@calendar = Calendar.new
	end 

	def create
		@calendar = Calendar.new(calendar_params)
		@calendar.owner_id = current_user.id
	end 

	def index
		@calendars = Calendar.all
	end 

	def show
		@calendar = Calendar.find(params[:id])
	end

	def destroy
		@calendar = Calendar.find(params[:id])
		@calendar.destroy
		redirect_to house_calendar_path(current_user.house_id)
	end


	private

	def calendar_params
		params.require(:calendar).permit(:name, :date, :importance, :owner_id)
	end

end
