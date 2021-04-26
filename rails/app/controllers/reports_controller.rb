class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find_by(id: params[:review_id]) || BeanReview.find_by(id: params[:review_id])
    @report = current_user.reports.find_or_create_by(review: @review)
    if @review.reports.size > 10
      DeleteReviewJob.perform_later(@review)
    end
    respond_to do |format|
      format.js
      format.html { redirect_to product_path(@review.product_id) }
    end
  end
end
