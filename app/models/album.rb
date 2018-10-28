class Album < ApplicationRecord
	PHOTOS_MAX_COUNT = 25
	validates :name, presence: {message: "Name can't be blank"}
	validates :name, length: {minimum: 5, maximum: 100}, allow_blank: true

	validate do
    	check_photos_count
  	end

	has_many :photos
	belongs_to :user

	accepts_nested_attributes_for :photos, allow_destroy: true#, reject_if: proc { |obj| obj['tag_line'].blank? || obj['image'].blank }


	def owner_of_album?(user)
		self.user == user
	end

	private

    def photos_count_invalid?
      photos.reject(&:marked_for_destruction?).count > PHOTOS_MAX_COUNT
    end

    def check_photos_count
      if photos_count_invalid?
        errors.add(:base, :photos_per_album,:message => "Maximum number of photo's per album is 25")
      end
    end
end
