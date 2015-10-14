class Expense < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :owner, class_name: "User"
  belongs_to :house
  validates :title, :amount, :date_due, presence: true

  def split_amount
    num_users = users.size
    amount / num_users
  end

	def expense_text
    "You owe #{owner.first_name} $#{amount}. Due #{date_due.strftime("%B %d")}."
  end

  def text_sender
    users.each do |user|
      user.send_text_message(expense_text)
    end
  end

  def due_in_3days?
    Time.now
  end

  def auto_text
  end

end



