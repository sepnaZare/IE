class Store < ActiveRecord::Base
	has_many :carts
	has_many :availables
	belongs_to :creator, :class_name => "User" , :foreign_key => "user_id"
end
