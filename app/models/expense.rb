class Expense < ActiveRecord::Base
  has_and_belongs_to_many :expenses
  belongs_to :owner, class_name: "User"
end
