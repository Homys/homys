class SettingsController < ApplicationController
  before_action :authenticate_user!, :ensure_house_exists, :get_house
  before_action :verified_phone, :if => :wants_sms?

  def index
    @housemates = @house.users
  end

  def show
  end
end
