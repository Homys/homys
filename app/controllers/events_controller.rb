class EventsController < ApplicationController

	before_action :authenticate_user!, :ensure_house_exists, :get_house, :verified_phone

	def create
		@event = Event.new(event_params)
		@event.house = @house
		@event.owner = current_user

		respond_to do |format|
			if @event.save
				format.html { redirect_to house_events_path(current_user.house), notice: 'Event added.' }
		    format.js {}

			else
				format.html { render :index, alert: 'There was an error.'  }
		    format.js {render status: '422'}
	  	end
		end

	end

	def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to house_path(@house)
  end


	private

	def event_params
		params.require(:event).permit(:name, :date, :importance, :owner_id)
	end

end