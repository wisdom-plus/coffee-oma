class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = case params[:type]
              when 'Review'
                Review.find_reviews(params[:review_id])
              when 'BeanReview'
                BeanReview.find_reviews(params[:review_id])
              end
    Report.create_report(current_user, @review)
    case params[:type]
    when 'Review'
      redirect_to product_path(@review.product_id), notice: t('.notice')
    when 'BeanReview'
      redirect_to bean_path(@review.bean_id), notice: t('.alert')
    end
  end
end
