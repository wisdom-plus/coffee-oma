class ReviewLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review_like = ReviewLike.new(user_id: current_user.id, review_id: params[:review_id])
    @review_like.save
    @review = Review.find(params[:review_id])
    render 'create.js.erb'
  end

  def destroy
    review_like = ReviewLike.find_by(id: params[:id])
    @review = Review.find_by(id: review_like.review_id)
    review_like.destroy
    render 'destroy.js.erb'
  end
end
