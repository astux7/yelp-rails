class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews

  def reviewed?(restaurant)
  	reviews.where(restaurant_id: restaurant.id).any?
  	#same
  	#reviews.where(restaurant: restaurant).any?
  end	
end
