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

def show
  @event = Event.find(params[:id]})

  respond_to do |wants|
    wants.html
    wants.ics do
      calendar = Icalendar::Calendar.new
      calendar.add_event(@event.to_ics)
      calendar.publish
      render :text => calendar.to_ical
    end
  end
end

	def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
			format.html {redirect_to house_path(@house)}
			format.js
		end 
  end


	private

	def event_params
		params.require(:event).permit(:title, :date, :end_date, :summary, :content, :owner_id)
	end

end