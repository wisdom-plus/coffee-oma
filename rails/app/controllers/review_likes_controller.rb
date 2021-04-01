class ReviewLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    case params[:type]
    when 'Review'
      @review_like = current_user.create_like(params[:type], params[:review_id])
      @review = Review.find(params[:review_id])
      @review.create_notification_like(current_user)
    when 'BeanReview'
      @review_like = current_user.create_like(params[:type], params[:review_id])
      @review = BeanReview.find(params[:review_id])
    end
    render 'create.js.erb'
  end

  def destroy
    case params[:type]
    when 'ProductReviewLike'
      review_like = current_user.destroy_like(params[:type], params[:id])
      @review = Review.find_by(id: review_like.liked_id)
    when 'BeanReviewLike'
      review_like = current_user.destroy_like(params[:type], params[:id])
      @review = BeanReview.find_by(id: review_like.liked_id)
    end
    render 'destroy.js.erb'
  end
end
