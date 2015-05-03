class Shopping < ActiveRecord::Base
	belongs_to :usage
	has_one :tag
	belongs_to :purchase
end
