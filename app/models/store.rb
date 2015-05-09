class Store < ActiveRecord::Base
	has_many :carts
	has_many :availables
	belongs_to :creator, :class_name => "User" , :foreign_key => "user_id"

	mount_uploader :store_image, AvatarUploader

	validates_presence_of :store_image
	validates_integrity_of :store_image
	validates_processing_of :store_image
end
