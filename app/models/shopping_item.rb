class ShoppingItem < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :user
  belongs_to :house
  validates_length_of :name, :maximum => 60, :allow_blank => false

  def reduce_points
  	update_attribute(:points_rewarded, (self.points_rewarded - 100))
  end 

  def self.reduce_all_points
  	self.all.each do |shopping_item|
  		shopping_item.reduce_points
  	end 
  end 
end
