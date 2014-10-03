class TagsController < ApplicationController
    
    def index
      
    end


    def show
      
    end

    def allow_params
      params[:restaurant].permit(:name, :description, :image_url, :promoted, :address, :price_range, :opening_hours, :tag_names)
    end

end

