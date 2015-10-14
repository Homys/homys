class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.owner_id = current_user.id

		if @event.save
			redirect_to house_events_path(current_user.house)
		else
			render :new
		end
	end

	def index
		@events = Event.all
	end

	private

	def event_params
		params.require(:event).permit(:name, :date, :importance, :owner_id)
	end

end
