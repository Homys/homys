module ApplicationHelper

	def user_verified_phone?
		current_user && current_user.has_verified_phone?
	end
end
