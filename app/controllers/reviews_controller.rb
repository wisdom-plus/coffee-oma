class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    if review.save
      redirect_to "/products/#{review_params[:product_id]}", notice: "レビューを登録しました"
    else
      render "/produvts/#{review_params[:product_id]}", alert: "レビューが登録に失敗しました"
    end
  end

  def index; end

  private

    def review_params
      params.require(:review).permit(:title, :rate, :content, :product_id, :user_id)
    end
end
