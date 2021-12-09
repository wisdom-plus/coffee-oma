class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = if params[:type] == 'Review'
                Review.find_reviews(params[:review_id])
              elsif params[:type] == 'BeanReview'
                BeanReview.find_reviews(params[:review_id])
              end
    Report.create_report(current_user, @review)
    if params[:type] == 'Review'
      redirect_to product_path(@review.product_id), notice: 'レビューを通報しました。'
    elsif params[:type] == 'BeanReview'
      redirect_to bean_path(@review.bean_id), notice: 'レビューを通報しました。'
    end
  end
end
