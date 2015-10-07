class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :phone_num, :avatar]
  end

	# def run
	# 	number_of_users = User.count 

	# 	array_users = (1..number_of_users).to_a
	# 	chore_user = array_users.select


	# 	ChoreItem(user_id) = chore_user
	# end

end
