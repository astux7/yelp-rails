class RestaurantsController < ApplicationController
    before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :delete]

	def new
      @restaurant = Restaurant.new
    end

    def create  
      #raise params[:restaurant].inspect
    	#safer using permit and say which field let to be changed
      @restaurant = Restaurant.create allow_params

      if @restaurant.save
  	   redirect_to restaurant_path(@restaurant)
      else
          render 'new'
      end
    end

    def index
      @restaurants = Restaurant.for_tag_or_all params[:tag_id]
    end

    def edit 
      @restaurant = Restaurant.find params[:id]
    end

    def update
      @restaurant = Restaurant.find params[:id]
      if @restaurant.update allow_params
        redirect_to restaurant_path
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

    def allow_params
      params[:restaurant].permit(:name, :description, :image_url, :promoted, :address, :price_range, :opening_hours, :tag_names)
    end

end

