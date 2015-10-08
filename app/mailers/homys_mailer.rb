class HomysMailer < ApplicationMailer
	default from: "homys.team@gmail.com"

	def invite(email)
		email = email
		mail(to: email, subject: "Come join your Homys")
	end

