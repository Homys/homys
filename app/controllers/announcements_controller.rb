class AnnouncementsController < ApplicationController

	before_action :authenticate_user!, :ensure_house_exists, :get_house, :verified_phone

	def index
		@announcements = @house.announcements.order('importance DESC', 'created_at DESC').page(params[:page])
		@announcement = Announcement.new

    respond_to do |format|
      format.html
      format.js
    end
	end


	def create
		@announcement = Announcement.new(announcement_params)
		@announcement.owner = current_user
		@announcement.house = @house

		respond_to do |format|
			if @announcement.save
				if @announcement.importance == "1"
					text_sender(@announcement.description)
				end

				format.html { redirect_to house_announcements_path(current_user.house), notice: 'Announcement added.' }
	    	format.js {}

			else
				format.html { render :index, alert: 'There was an error.'  }
	      format.js {render status: '422'}
			end
		end
	end


	def destroy
		@announcement = Announcement.find(params[:id])
		@announcement.destroy

		respond_to do |format|
			format.html {redirect_to house_announcements_path(current_user.house)}
			format.js
		end 

	end

	def text_sender(body)
		current_user.house.send_to_all_users(body)
	end

private

	def announcement_params
		params.require(:announcement).permit(:title, :description, :importance)
	end

end
