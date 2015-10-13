class PhoneNumber < ActiveRecord::Base

	def generate_pin
  	self.pin = rand(0000..9999).to_s.rjust(4, "0")
  	save
	end

	def twilio_client
    binding.pry
  	Twilio::REST::Client.new(ENV["twilio_account_sid"], ENV["twilio_auth_token"])
	end


def send_pin
  binding.pry
  twilio_client.messages.create(
    to: phone_number,
    from: ENV["our_twilio_num"],
    body: "Your PIN is #{pin}"
  )
end

def verify(entered_pin)
  update(verified: true) if self.pin == entered_pin
end

end
