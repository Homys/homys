class HomysMailer < ApplicationMailer
	include SendGrid
	default from: "homys.team@gmail.com"

	def invite(email, user)
		@current_user = user
    email = email
		mail(to: email, subject: "Come join your Homys")
	end
end
