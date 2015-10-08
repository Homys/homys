class HousesController < PrivateController
  def create
  	@house = House.new(house_params)
    @house.users << current_user

  	if @house.save
  		redirect_to house_path(@house)
  	else
  		render :new
  	end

  end

  def add_housemate
  	@user = User.find_by(email: params[:email])
  	if @user
      @user.house_id = current_user.house_id
    	if @user.save
    		redirect_to houses_url
    	else
    		redirect_to house_path(current_user.house)
    	end
    else
      HomysMailer.invite(params[:email], current_user).deliver_now
      redirect_to house_path(current_user.house), alert: "User does not exist, invitation to housemate sent"
    end
  end

  def new
    @house = House.new
  end

  def index
    if current_user
      if current_user.house_id
       redirect_to house_path(current_user.house)
     end
    end
  end

  def show
  	@house = House.find(params[:id])
  end


  private

  def house_params
  	params.require(:house).permit(:name)
	end

end