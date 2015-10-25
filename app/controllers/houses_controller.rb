class HousesController < ApplicationController
  before_action :authenticate_user!, :verified_phone
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
      	redirect_to house_settings_path(current_user.house), notice: "User cannot be assigned to this house"
      end
    else
      redirect_to house_settings_path(current_user.house), alert: "User does not exist, invite homy below"
    end
  end

  def invite_housemate
     HomysMailer.invite(params[:email], current_user).deliver_now
     redirect_to house_settings_path(current_user.house), notice: "Sent invite email to your homy"
  end

  def new
    @house = House.new
  end

  def show
  	@house = House.find(params[:id])
    @users = @house.users
    @events = @house.events.all
    @event = Event.new


data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [65, 59, 80, 81, 56, 55, 40]
        },
        {
            label: "My Second dataset",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [28, 48, 40, 19, 86, 27, 90]
        }
    ]
}
options = {}




  end

  def destroy
    if params[:id] == "user"
      current_user.house_id = nil
      redirect_to houses_path
    else
      @house = House.find(params[:id]) # do i need to remove users associations to the house before?
      @house.destroy
      redirect_to houses_path
    end
  end

  def index
    if current_user.house_id != nil
      redirect_to house_path(current_user.house)
    end 

  end 


  private

  def house_params
  	params.require(:house).permit(:name)
	end

end