class AnnouncementsController < PrivateController
	
	require 'twilio-ruby'

	def index
		@announcements = Announcement.order('importance DESC', 'created_at DESC')
	end

	def new
		@announcement = Announcement.new
	end

	def create
		@announcement = Announcement.new(announcement_params)
		@announcement.owner_id = current_user.id

		if @announcement.save
			text_sender(@announcement.title)
		else
			render :new
		end
	end

	def destroy
		@announcement = Announcement.find(params[:id])
		@announcement.destroy
		redirect_to house_announcements_path(current_user.house_id)
	end

private

	def announcement_params
		params.require(:announcement).permit(:title, :description, :importance)
	end

	def text_sender(body)
		current_user.house.send_to_all_users(body)

		redirect_to house_announcements_path(current_user.house_id)
	end

end
