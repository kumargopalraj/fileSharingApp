class HomeController < ApplicationController
	def index
		if user_signed_in?
			@photos = current_user.photos.recent.last(25)
		else
			@photos = Photo.recent.last(25)
		end
	end
end
