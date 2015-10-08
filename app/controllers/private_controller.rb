class PrivateController < ApplicationController

  before_action :ensure_logged_in

  def ensure_logged_in
  	unless current_user
  		flash[:alert] = "Please log in"
  		redirect_to new_user_session_path
  	end
  end


end 
