class ReviewsController < ApplicationController

  def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
  end

if current_user.has_reviewed? @restaurant

end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params)
    redirect_to '/restaurants'
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end


end
