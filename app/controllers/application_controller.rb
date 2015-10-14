class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def ensure_house_exists
    if current_user.house_id == nil
      redirect_to houses_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :phone_num, :avatar]
  end

  private
  def get_house
    @house = House.find(params[:house_id])
  end

end
