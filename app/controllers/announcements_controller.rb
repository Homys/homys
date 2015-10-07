class AnnouncementsController < ApplicationController
	def new 
		@announcement = Announcement.new
	end 

	def create 
		@announcement = Announcement.new(announcement_params)
	
		if @announcement.save
			redirect_to announcements_path
		else 
			render :new
		end 
	end 

	def index 
		@announcements = Announcement.all 
	end 

private 

	def announcement_params
		params.require(:announcement).permit(:title, :description, :importance, :owner_id)
	end
end
