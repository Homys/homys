class House < ActiveRecord::Base
  has_many :users
  has_many :created_chores, through: :users
  has_many :shopping_items
  has_many :expenses
  has_many :chore_items
  has_many :announcements
  has_many :commandments
  has_many :events
  validates :name, presence: true

  require 'twilio-ruby'

  def assign_chores
  	created_chores.each do |chore|
  		chore.user = users.sample
      chore.done = 0
  		chore.save
  	end
  end

  def self.assign_all_chores
    self.all.each do |house|
      house.assign_chores
    end
  end

  def send_to_all_users(body)
    users.each do |user|
      user.send_text_message(body)
    end
  end

  def self.point_updater
      1000
  end



end