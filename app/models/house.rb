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

  def send_to_all_users(body)
    users.each do |user|
      user.send_text_message(body)
    end 
  end 

end