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

      #assign a user one by one to each chore, start at beginning of users once gone through all


  # number_of_users = users.length

  # chore_items.shuffle.each_with_index do |chore, index|
  #   chore.user = users[index % number_of_users]
  #   chore.done = false
  #   chore.save
  # end

  #either method seems to work, understand this one a bit more
  chores = chore_items.shuffle
  i = 0
  chores.each do |chore|
    if i == users.count
      i = 0
    end

    chore.user = users[i]
    chore.done = 0
    chore.save
    i += 1
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


  def self.reduce_all_points
    model_classes = [ChoreItem, ShoppingItem, Expense]
    model_classes.each do |model_class|
      model_class.all.each do |item|
        item.reduce_points
      end
    end
  end


end