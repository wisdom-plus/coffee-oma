class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @report = current_user.reports.find_or_create_by(review_id: params[:review_id])
    @review = Review.find(params[:review_id])
    if @review.reports.size > 10
      DeleteReviewJob.perform_later(params[:review_id])
    end
    respond_to do |format|
      format.js
      format.html { redirect_to product_path(@review.product_id) }
    end
  end
end
