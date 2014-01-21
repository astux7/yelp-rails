class RestaurantsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]
	def new
       @restaurant = Restaurant.new
    end

    def create  
        authenticate_user!
    	#raise params[:restaurant].inspect
    	#safer using permit and say which field let to be changed
        @restaurant = Restaurant.create params[:restaurant].permit(:name, :description, :image_url)

        if @restaurant.save
    	   redirect_to restaurants_path
        else
            render 'new'
        end
    end

    def index
    	@restaurants = Restaurant.all
    end

    def edit 
        authenticate_user!
    	@restaurant = Restaurant.find params[:id]
    end

    def update
        @restaurant = Restaurant.find params[:id]
        @restaurant.update params[:restaurant].permit(:name, :description, :image_url)
        redirect_to restaurants_path
    end

    def destroy 
        authenticate_user!
        @restaurant = Restaurant.find params[:id]
        @restaurant.destroy

        redirect_to restaurants_path
    end

    def show
        @restaurant = Restaurant.find params[:id]
    end

end

