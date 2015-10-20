class ChoreItem < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :user
  belongs_to :house
  validates_length_of :name, :maximum => 60, :allow_blank => false 
  validates_length_of :description, :maximum => 140, :allow_blank => true 

  def reduce_points 
  	if points_rewarded > 100
  		update_attribute(:points_rewarded, (self.points_rewarded - 100))
  	end 
  end 


end