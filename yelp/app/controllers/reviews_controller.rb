class ReviewsController < ApplicationController
	def new
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = Review.new(restaurant: @restaurant)
	end

	def create
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = Review.new(params[:review].permit(:name,:content,:rating))

		@review.restaurant = @restaurant

		if @review.save
			redirect_to restaurant_path(@restaurant)
		else
			render 'new'
		end

	end
end
