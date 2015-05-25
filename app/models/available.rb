class Available < ActiveRecord::Base
	belongs_to :item
	belongs_to :store
	has_many :comments
end
