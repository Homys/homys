class Expense < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :owner, class_name: "User"
  belongs_to :house
  validates :title, :amount, :date_due, presence: true
end
