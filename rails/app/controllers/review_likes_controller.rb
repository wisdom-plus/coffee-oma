class ReviewLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:type] == 'Review'
      @review_like = current_user.create_product_review_like(params[:review_id])
      @review = Review.find(params[:review_id])
      @review.create_notification_like(current_user)
    elsif params[:type] == 'BeanReview'
      @review_like = current_user.create_bean_review_like(params[:review_id])
      @review = BeanReview.find(params[:review_id])
    end
    render 'create.js.erb'
  end

  def destroy
    if params[:type] == 'ProductReviewLike'
      review_like = current_user.destroy_product_review_like(params[:id])
      @review = Review.find_by(id: review_like.liked_id)
    elsif params[:type] == 'BeanReviewLike'
      review_like = current_user.destroy_bean_review_like(params[:id])
      @review = BeanReview.find_by(id: review_like.liked_id)
    end
    render 'destroy.js.erb'
  end
end
