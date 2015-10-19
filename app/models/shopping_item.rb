class ShoppingItem < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :user
  belongs_to :house
  validates_length_of :name, :maximum => 60, :allow_blank => false

  def reduce_points
  	new_points = points_rewarded - 100
  	update_attribute(:points_rewarded, new_points)
  end 
end
