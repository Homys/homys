class Commandment < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  validates :title, presence: true
end
