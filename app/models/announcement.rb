class Announcement < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  validates :title, :description, presence: true

end
