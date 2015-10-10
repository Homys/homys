class Announcement < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  validates :title, :description, presence: true

def send_text_message
    # number_to_send_to = recipient.phone
    number_to_send_to = ENV["jill"]

   	account_sid = ENV["twilio_account_sid"]
	auth_token = ENV["twilio_auth_token"]
    our_twilio_num = ENV["our_twilio_num"]

    client = Twilio::REST::Client.new account_sid, auth_token

    @twilio_client.account.sms.messages.create(
      :from => "#{our_twilio_num}",
      :to => number_to_send_to,
      :body => "Hey, Twilio works!"
    )
  end


end
