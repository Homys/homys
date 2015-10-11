class House < ActiveRecord::Base
  has_many :users
  has_many :created_chores, through: :users
  validates :name, presence: true

  require 'twilio-ruby'

	def assign_chores
  	created_chores.each do |chore|
  		chore.user = users.sample
  		chore.save
  	end
  end

  def send_text_message
    # number_to_send_to = users.phone_num
    number_to_send_to = ENV["jill"]

    account_sid = ENV["twilio_account_sid"]
    auth_token = ENV["twilio_auth_token"]
    our_twilio_num = ENV["our_twilio_num"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.sms.messages.create(
    :from => "#{our_twilio_num}",
    :to => number_to_send_to,
    :body => "Hey, Twilio works!"
  )
  end


end