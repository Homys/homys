class SettingsController < ApplicationController
  before_action :authenticate_user!, :ensure_house_exists, :get_house, :verified_phone

  def index
    @housemates = @house.users
  end
end
