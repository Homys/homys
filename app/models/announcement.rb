class Announcement < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :house
  
  validates_length_of :description, :maximum => 140, :allow_blank => false 
   

end
