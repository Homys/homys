class Event < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	belongs_to :house
	validates_length_of :name, :maximum => 60, :allow_blank => false 
end
