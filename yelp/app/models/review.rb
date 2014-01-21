class Review < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
	validates :rating, inclusion: {in: :valid_ratings.to_proc, message: 'is not a valid rating'}
	#if review exist with id restaurant we cannot leave a review
	validates :restaurant_id, uniqueness: {message: 'Review already been written'}
	def valid_ratings
	    if restaurant.promoted?
	      return 1..5
	    end
	    1..4
	 end
end
