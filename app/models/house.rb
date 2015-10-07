class House < ActiveRecord::Base
  has_many :users
  has_many :created_chores, through: :users
end
