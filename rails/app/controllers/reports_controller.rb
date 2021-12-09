class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = if params[:type] == 'Review'
                Review.find_reviews(params[:review_id])
              else
                BeanReview.find_reviews(params[:review_id])
              end
    Report.create_report(current_user, @review)
    redirect_to product_path(@review.product_id),notice: 'レビューを通報しました。'
  end
end
