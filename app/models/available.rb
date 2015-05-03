class Available < ActiveRecord::Base
	belongs_to :item
	belongs_to :store
end
