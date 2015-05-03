class Usage < ActiveRecord::Base
	belongs_to :cart
	has_many :shoppings
	belongs_to :user
end
