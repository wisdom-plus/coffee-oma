class ReviewLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review_like = ReviewLikeAndNotificationCreate.new(current_user, params[:type], params[:review_id]).create
    @review = @review_like.accociated_review.decorate
    # @reviewと@review_likeはviewに必要
    respond_to do |format|
      format.js
      format.html { redirect_to product_path(@review), status: :see_other }
    end
  end

  def destroy
    case params[:type]
    when 'ProductReviewLike'
      review_like = current_user.product_review_likes.find_by(id: params[:id])
    when 'BeanReviewLike'
      review_like = current_user.bean_review_likes.find_by(id: params[:id])
    end
    review_like&.destroy unless review_like.nil?
    @review = review_like.accociated_review.decorate
    # @reviewがviewに必要
    respond_to do |format|
      format.js
      format.html { redirect_to product_path(@review), status: :see_other }
    end
  end
end
