class HousesController < ApplicationController
  def create
  	@house = House.new(house_params)

  	if @house.save
      current_user.house_id = @house.id
  		redirect_to house_path(@house)
  	else
  		render :new
  	end

  end

  def add_housemate
  	@house = House.find(params[:house_id])

  	@user = User.find_by(email: params[:email])
  	@user.house_id = params[:house_id]
  	if @user.save
  		# redirect_to house_url(params[:house_id])
  		redirect_to houses_url
  	else
  		redirect_to house_path(@house)
  	end
  end

  def new
    @house = House.new
  end

  def index
  end

  def show
  	@house = House.find(params[:id])
  end


  private

  def house_params
  	params.require(:house).permit(:name)
	end

end