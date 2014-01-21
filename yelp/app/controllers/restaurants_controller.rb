class RestaurantsController < ApplicationController
    before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :delete]
	def new
       @restaurant = Restaurant.new
    end

    def create  
        #raise params[:restaurant].inspect
    	#safer using permit and say which field let to be changed
        @restaurant = Restaurant.create params[:restaurant].permit(:name, :description, :image_url, :promoted, :address)

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
       @restaurant = Restaurant.find params[:id]
    end

    def update
        @restaurant = Restaurant.find params[:id]
        if @restaurant.update params[:restaurant].permit(:name, :description, :image_url, :promoted, :address)
            redirect_to restaurants_path
        else
            render 'edit'
        end
    end

    def destroy 
        @restaurant = Restaurant.find params[:id]
        @restaurant.destroy

        redirect_to restaurants_path
    end

    def show
        @restaurant = Restaurant.find params[:id]
    end

end

