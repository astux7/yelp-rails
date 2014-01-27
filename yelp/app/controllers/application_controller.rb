class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :most_recent_reviews

  def most_recent_reviews
    @last_reviews = Review.order('created_at DESC').limit(10)
  end
end
