class ReviewLikesController < ApplicationController
  include TurboStreamComponent
  before_action :authenticate_user!

  def create
    @review_like = ReviewLikeAndNotificationCreate.new(current_user, params[:type], params[:review_id]).create
    @review = @review_like.accociated_review.decorate
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
          turbo_stream_replace(@review, @review_like)
      end
      format.html { redirect_to product_path(@review), status: :see_other }
    end
  end

  def destroy
    review_like = get_review_like(params[:type], params[:id])
    review_like&.destroy
    @review = review_like.accociated_review.decorate
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
          turbo_stream_replace(@review)
      end
      format.html { redirect_to product_path(@review), status: :see_other }
    end
  end

  private

    def get_review_like(type, params_id)
      current_user.likes.find_by(id: params_id, type: type)
    end

    def turbo_stream_replace(review, review_like = nil)
      turbo_stream.replace(
        "review_like_button_#{review.id}",
        ReviewLikeButton::Component.new(review: review, review_like: review_like).render_in(view_context)
      )
    end
end
