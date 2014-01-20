class Review < ActiveRecord::Base
	belongs_to :restaurant

	def valid_ratings
	    if restaurant.promoted?
	      return 1..5
	    end
	    1..4
	 end
end
