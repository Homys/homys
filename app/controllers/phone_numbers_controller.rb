class PhoneNumbersController < ApplicationController

	def new 
		@phone_number = PhoneNumber.new
	end

	def create
  	@phone_number = PhoneNumber.find_or_initialize_by(phone_number: params[:phone_number][:phone_number])
  	@phone_number.user = current_user
    @phone_number.save
    @phone_number.generate_pin
  	@phone_number.send_pin

  	respond_to do |format|
    	format.js # render app/views/phone_numbers/create.js.erb
  	end
	end

	def verify
    @phone_number = PhoneNumber.find_by(phone_number: params[:hidden_phone_number])
    @phone_number.verify(params[:pin])

    redirect_to houses_path, notice: "Hey, your phone has been verified!"
	end

end 