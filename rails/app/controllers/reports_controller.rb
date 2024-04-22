class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    klass = params[:type].constantize
    @review = klass.find_reviews(params[:review_id])
    Report.create_report(current_user, @review)
    case params[:type]
    when 'Review'
      redirect_to product_path(@review.product_id), notice: t('.notice'), status: :see_other
    when 'BeanReview'
      redirect_to bean_path(@review.bean_id), notice: t('.alert'), status: :see_other
    end
  end
end
