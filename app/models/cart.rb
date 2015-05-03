class Cart < ActiveRecord::Base
	has_one :usage
	belongs_to :store
end
