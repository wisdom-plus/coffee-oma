class ReviewLikesController < ApplicationController
  include TurboStreamComponent
  before_action :authenticate_user!

  def create
    @review_like = ReviewLikeAndNotificationCreate.new(current_user, params[:type], params[:review_id]).create
    @review = @review_like.accociated_review.decorate
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
          turbo_stream.replace(
            "review_like_button_#{@review.id}",
            ReviewLikeButton::Component.new(review: @review, review_like: @review_like).render_in(view_context)
          )
      end
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
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
          turbo_stream.replace(
            "review_like_button_#{@review.id}",
            ReviewLikeButton::Component.new(review: @review, review_like: nil).render_in(view_context)
          )
      end
      format.html { redirect_to product_path(@review), status: :see_other }
    end
  end
end
