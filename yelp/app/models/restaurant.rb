class Restaurant < ActiveRecord::Base
	has_many :reviews

	def average_rating
   		reviews.average('rating') || 'Unrated'
    # return 'Unrated' if reviews.none?

    # total = reviews.inject(0) { |sum, review|
    #   sum += review.rating
    # }

    # (total / reviews.length)
    end
end
