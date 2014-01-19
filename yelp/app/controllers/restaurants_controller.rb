class RestaurantsController < ApplicationController
	def new
       @restaurant = Restaurant.new
    end

    def create  
    	#raise params[:restaurant].inspect
    	#safer using permit and say which field let to be changed
        Restaurant.create params[:restaurant].permit(:name, :description)
    	redirect_to '/restaurants'
    end

    def index
    	@restaurants = Restaurant.all
    end

    def edit 
    	@restaurant = Restaurant.find params[:id]
    end

    def update
        @restaurant = Restaurant.find params[:id]
        @restaurant.update params[:restaurant].permit(:name, :description)
        redirect_to '/restaurants'
    end
end

