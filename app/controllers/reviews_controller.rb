class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params, user_id: current_user.id)
    review.save
    redirect_to "/products/#{review_params[:product_id]}"
  end

  def index
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :product_id)
  end

end
