class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = if params[:type] == 'Review'
                Review.find_by(id: params[:review_id])
              else
                BeanReview.find_by(id: params[:review_id])
              end
    Report.create_report(current_user, @review)
    respond_to do |format|
      format.js
      format.html { redirect_to product_path(@review.product_id) }
    end
  end
end
