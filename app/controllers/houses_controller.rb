class HousesController < ApplicationController
  before_action :verified_phone, :except => [:index, :show]
  before_action :authenticate_user!, :except => [:index]

  def create
  	@house = House.new(house_params)
    @house.users << current_user

  	if @house.save
  		redirect_to house_path(@house)
  	else
  		render :new
  	end

  end

  def add_housemate #maybe change to update
  	@user = User.find_by(email: params[:email])
  	if @user
      if @user.house_id == nil
       #  @user.house_id = current_user.house_id
      	# @user.save
        HomysMailer.confirm_house(@user.email, @user, current_user.house, current_user).deliver_now
      	redirect_to house_path(current_user.house), notice: "Request email sent to Homy"
      else
      	redirect_to house_path(current_user.house), notice: "User cannot be assigned to this house"
      end
    else
      redirect_to house_path(current_user.house), alert: "User does not exist, invite homy to sign up for site below"
    end
  end

  def invite_housemate
     HomysMailer.invite(params[:email], current_user).deliver_now
     redirect_to house_path(current_user.house), notice: "Sign up email sent, don't forget to add your housemate below once he/she has created an account"
  end


  def show
  	@house = House.find(params[:id])
    @users = @house.users.order('total_points DESC')
    @events = @house.events.all
    @event = Event.new
  end

  def destroy
    if params[:id] == "user"
      current_user.house_id = nil
      current_user.total_points = 0
      current_user.save
      redirect_to houses_path
    else
      @house = House.find(params[:id])
      @house.users.each do |user|
        user.house_id = nil
        user.total_points = 0
        user.save
      end
      @house.destroy
      redirect_to houses_path
    end
  end

  def index
    if current_user
      if current_user.house_id != nil && current_user.has_verified_phone?
        redirect_to house_path(current_user.house)
      elsif  current_user.has_verified_phone? == nil
          redirect_to new_phone_number_path
      else
        @house = House.new
      end
    else
      redirect_to welcome_index_path
    end
  end

  def confirm_house
    if current_user && current_user == User.find(params[:user_id]) && User.find(params[:house_member]).house_id == params[:house_id].to_i
      current_user.house_id = params[:house_id]
      current_user.save
      redirect_to house_path(current_user.house), notice: "Welcome to #{current_user.house.name}"
    else
      redirect_to houses_path, notice: "Please make sure you are logged in as the correct user."
    end
  end


  private

  def house_params
  	params.require(:house).permit(:name)
	end

end