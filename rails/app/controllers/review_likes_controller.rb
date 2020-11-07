class ReviewLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review_like = current_user.create_review_like(params[:review_id])
    @review_like.save
    @review = Review.find(params[:review_id])
    @review.create_notification_like(current_user)
    render 'create.js.erb'
  end

  def destroy
    review_like = current_user.destroy_review_like(params[:id])
    @review = Review.find_by(id: review_like.review_id)
    render 'destroy.js.erb'
  end
end
