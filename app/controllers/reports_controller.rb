class ReportsController < ApplicationController
  def create
    @report = current_user.reports.find_or_create_by(review_id: params[:review_id])
    @report.save
    @review = Review.find(params[:review_id])
    render "create.js.erb"
  end
end
