class PhoneNumbersController < ApplicationController

	def new
		@phone_number = PhoneNumber.new
	end

	def create

    if PhoneNumber.find_by_phone_number(params[:phone_number][:phone_number])
      @phone_number = PhoneNumber.new
    else
      @phone_number = PhoneNumber.new(phone_number: params[:phone_number][:phone_number])
      @phone_number.user = current_user

      @phone_number.save
      @phone_number.generate_pin
    	@phone_number.send_pin
    end

  	respond_to do |format|
    	format.js # render app/views/phone_numbers/create.js.erb
  	end
	end

	def verify #might be able to remove
    @phone_number = PhoneNumber.find_by(phone_number: params[:hidden_phone_number])
    unless @phone_number.user == current_user
      render :new, notice: "Hey, that's not your phone number!"
    end

    @phone_number.verify(params[:pin])

    current_user.phone_num = @phone_number.phone_number
    current_user.is_verified = true
    current_user.save
    redirect_to houses_path, notice: "Hey, your phone has been verified!"
	end

end