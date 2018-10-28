class Photo < ApplicationRecord
	belongs_to :user
	belongs_to :album
	mount_uploader :image, ImageUploader

	scope :recent, -> { order(created_at: :asc) }
end
