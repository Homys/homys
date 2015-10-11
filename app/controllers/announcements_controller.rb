class AnnouncementsController < ApplicationController

	before_action :authenticate_user!
	before_filter :ensureHouseExists


	def new
		@announcement = Announcement.new
	end

	def create
		@announcement = Announcement.new(announcement_params)
		@announcement.owner_id = current_user.id

		if @announcement.save
			redirect_to house_announcements_path(current_user.house_id)
		else
			render :new
		end
	end

	def index
		@announcements = Announcement.order('importance DESC', 'created_at DESC')

		respond_to do |format|
			format.html
			format.js
		end

		if @announcements.length == 0
      		flash[:alert] = "You have no announcements. Create one now to share with your housemates."
		end 
	end

	def destroy
		@announcement = Announcement.find(params[:id])
		@announcement.destroy
		redirect_to house_announcements_path(current_user.house_id)
	end

	def text_sender
		current_user.house.send_text_message

		redirect_to house_announcements_path(current_user.house_id)
	end

private

	def announcement_params
		params.require(:announcement).permit(:title, :description, :importance)
	end
end
