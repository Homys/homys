class Expense < ActiveRecord::Base
  has_many :payments
  has_many :users, through: :payments
  belongs_to :owner, class_name: "User"
  belongs_to :house
  validates_length_of :title, :maximum => 60, :allow_blank => false
  validates :amount, :date_due, presence: true

  def split_amount
    num_users = users.size
    split = amount / num_users
    split.round(2)
  end

	def expense_text
    "Just a friendly reminder, you owe #{owner.first_name} $#{split_amount} for #{title}."
  end

  def text_sender
    sms_users = users.select { |user| user.send_sms == true}
    if !sms_users.nil?
      sms_users.each do |user|
        user.send_text_message(expense_text)
      end
    end
  end

  def reduce_points
    if points_rewarded > 100
      update_attribute(:points_rewarded, (self.points_rewarded - 100))
    end
  end

end



