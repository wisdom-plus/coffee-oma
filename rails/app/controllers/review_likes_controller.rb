class ReviewLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review_like, @review = ReviewLikeAndNotificationCreate.new(current_user, params[:type], params[:review_id]).create
    # @reviewと@review_likeはviewに必要
    respond_to do |format|
      format.js
      format.html { redirect_to product_path(@review) }
    end
  end

  def destroy
    case params[:type]
    when 'ProductReviewLike'
      review_like = current_user.product_review_likes.find_by(id: params[:id])
      @review = Review.find_by(id: review_like.liked_id)
    when 'BeanReviewLike'
      review_like = current_user.bean_review_likes.find_by(id: params[:id])
      @review = BeanReview.find_by(id: review_like.liked_id)
    end
    review_like&.destroy unless review_like.nil?
    # @reviewがviewに必要
    respond_to do |format|
      format.js
      format.html { redirect_to product_path(@review) }
    end
  end
end
