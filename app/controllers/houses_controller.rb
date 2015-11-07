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
        @user.house_id = current_user.house_id
      	@user.save
      	redirect_to house_path(current_user.house)
      else
      	redirect_to house_path(current_user.house), notice: "User cannot be assigned to this house"
      end
    else
      redirect_to house_path(current_user.house), alert: "User does not exist, invite homy below"
    end
  end

  def invite_housemate
     HomysMailer.invite(params[:email], current_user).deliver_now
     redirect_to house_path(current_user.house), notice: "Sent invite email to your homy"
  end


  def show
  	@house = House.find(params[:id])
    @users = @house.users.order('total_points DESC')
    @events = @house.events.all
    @event = Event.new

  respond_to do |wants|
    wants.html
    wants.ics do
      calendar = Icalendar::Calendar.new
      calendar.add_event(@event.to_ics)
      calendar.publish
      render :text => calendar.to_ical
    end
  end

end


  def destroy
    if params[:id] == "user"
      current_user.house_id = nil
      redirect_to houses_path
    else
      @house = House.find(params[:id])
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


  private

  def house_params
  	params.require(:house).permit(:name)
	end

end