class ReviewsController < ApplicationController
	#before_action :authenticate_user!
	def new
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = Review.new(restaurant: @restaurant)
	end

	def create
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = Review.new(params[:review].permit(:name,:content,:rating))
		@review.restaurant = @restaurant
		@review.user = current_user

		if @review.save
			redirect_to restaurant_path(@restaurant)
		else
			render 'new'
		end

	end

	def destroy
	  @review = Review.find(params[:id])
	  @review.destroy
	  flash[:notice] = "Review was deleted succesfully!"
	  redirect_to restaurant_path(@review.restaurant_id)
	end

end
