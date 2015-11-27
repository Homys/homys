class HomysMailer < ApplicationMailer
	include SendGrid
	default from: "homys.team@gmail.com"

	def invite(email, user)
		@current_user = user
    email = email
		mail(to: email, subject: "Come join your Homys")
	end

  def confirm_house(email, user, house, current_user)
    @current_user = current_user
    @user = User.find_by(email: email)
    email = email
    @house = house.id
    mail(to: email, subject: "Your Homy wants you to join the house")
  end
end
