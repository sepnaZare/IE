class Item < ActiveRecord::Base
	has_many :tags

	mount_uploader :item_image, AvatarUploader

	validates_presence_of :item_image
	validates_integrity_of :item_image
	validates_processing_of :item_image

	def self.search(search)
  		if search
  			self.where('name LIKE ? OR item_type LIKE ? OR item_company LIKE ?', "%#{search}%" , "%#{search}%" , "%#{search}%")
  		else
    		self.all
  		end
	end

end
