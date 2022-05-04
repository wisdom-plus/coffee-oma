class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    review = current_user.reviews.create(review_params)
    if review.save
      flash[:notice] = t('.notice')
    else
      flash[:alert] = t('.alert')
    end
    redirect_to product_path(review.product_id)
  end

  private

    def review_params
      params.require(:review).permit(:title, :rate, :content).merge(product_id: params[:product_id])
    end
end
