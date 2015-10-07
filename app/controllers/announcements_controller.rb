class AnnouncementsController < ApplicationController
	def new
		@announcement = Announcement.new
	end

	def create
		@announcement = Announcement.new(announcement_params)
		@announcement.owner_id = current_user.id

		if @announcement.save
			redirect_to announcements_path
		else
			render :new
		end
	end

	def index
		@announcements = Announcement.order('importance DESC', 'created_at DESC')
	end

	def destroy
		@announcement = Announcement.find(params[:id])
		@announcement.destroy
		redirect_to announcements_path
	end

private

	def announcement_params
		params.require(:announcement).permit(:title, :description, :importance)
	end
end
