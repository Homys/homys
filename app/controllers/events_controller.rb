class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.house = @house 
		@event.owner = current_user

		if @event.save
			redirect_to house_events_path(current_user.house)
		else
			render :new
		end

		respond_to do |format|
			if @event.save
				format.html { redirect_to house_events_path(current_user.house), notice: 'Event created.' }
	      format.js {}
			else
				format.html { render :index, alert: 'There was an error.'  }
	      format.js {render status: '422'}
			end
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