class ShoppingItem < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :user
  validates :name, :importance, presence: true

end
