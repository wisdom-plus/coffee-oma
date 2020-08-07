class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    review.save
    redirect_to "/products/#{review_params[:product_id]}"
  end

  def index
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :product_id, :user_id)
  end

end
