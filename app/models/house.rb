class House < ActiveRecord::Base
  has_many :users
  has_many :created_chores, through: :users
  has_many :shopping_items
  has_many :expenses
  has_many :chore_items
  has_many :announcements
  has_many :commandments
  validates :name, presence: true

  require 'twilio-ruby'

	def assign_chores
  	created_chores.each do |chore|
  		chore.user = users.sample
      chore.done = 0
  		chore.save
  	end
  end

  def send_to_all_users(body)
    users.each do |user|
      user.send_text_message(body)
    end
  end

end