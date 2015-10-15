class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :announcements, foreign_key: "owner_id"
  has_many :commandments, foreign_key: "owner_id"
  has_many :created_shopping_items, class_name: "ShoppingItem", foreign_key: "owner_id"
  has_many :shopping_items, class_name: "ShoppingItem", foreign_key: "user_id"
  has_many :created_chores, class_name: "ChoreItem", foreign_key: "owner_id"
  has_many :chore_items, class_name: "ChoreItem", foreign_key: "user_id"
  has_and_belongs_to_many :expenses
  has_many :created_expenses, class_name: "Expense", foreign_key: "owner_id"
  belongs_to :house

  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end


  def send_text_message(body)
    account_sid = ENV["twilio_account_sid"]
    auth_token = ENV["twilio_auth_token"]
    our_twilio_num = ENV["our_twilio_num"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.messages.create(
      :from => "#{our_twilio_num}",
      :to   => phone_num,
      :body => body
    )
  end



end
