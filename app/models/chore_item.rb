class ChoreItem < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :user
  validates :name, :description, presence: true

end
