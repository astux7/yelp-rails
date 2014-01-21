class Restaurant < ActiveRecord::Base
	has_many :reviews

	validates :name, presence: true, length: {minimum: 3}, uniqueness: true
	validates :description, presence: true
	geocoded_by :address
	after_validation :geocode

	def average_rating
   		reviews.average('rating') || 'Unrated'
    end
    #??
    alias_method :rating, :average_rating
end
