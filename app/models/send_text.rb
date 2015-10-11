require 'rubygems'
require 'twilio-ruby'
 
account_sid = ENV["twilio_account_sid"]
auth_token = ENV["twilio_auth_token"]
client = Twilio::REST::Client.new account_sid, auth_token
 
from = ENV["our_twilio_num"] # Your Twilio number
 
friends = {
ENV["cobi"] => "Cobi",
ENV["jon"] => "Jon",
ENV["jill"] => "Jill"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Twilio is great!"
  )
  puts "Sent message to #{value}"
end




