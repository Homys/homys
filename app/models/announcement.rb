class Announcement < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :house
  validates :title, presence: true

end
