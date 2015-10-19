class ChoreItem < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :user
  belongs_to :house
  validates_length_of :name, :maximum => 60, :allow_blank => false 
  validates_length_of :description, :maximum => 140, :allow_blank => true 
 # def self.point_updater
    
 #    # users.each do |user|
 #      # user.total_points = 
 #      # 1000 
 #    # speed = Time.now - chore.updated_at
 #    # 100 - speed*(10**-3)
 #    # end 
 #  end 


end