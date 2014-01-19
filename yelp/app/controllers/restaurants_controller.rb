class RestaurantsController < ApplicationController
	def new

    end

    def create  
    	#raise params[:restaurant].inspect
        Restaurant.create params[:restaurant].permit(:name, :description)
    	redirect_to '/restaurants'

    end

    def index
    	@restaurants = Restaurant.all
    end
end

