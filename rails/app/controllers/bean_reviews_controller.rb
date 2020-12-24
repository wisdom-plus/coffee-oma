class BeanReviewsController < ApplicationController
  def create
    @bean_review = current_user.bean_reviews.new(bean_review_params)
    if @bean_review.save
      flash[:notice] = '登録に成功しました'
    else
      flash[:alert] = '登録に失敗しました'
    end
    redirect_to bean_path(@bean_review.bean_id)
  end

  private

    def bean_review_params
      params.require(:bean_review).permit(:acidity, :bitter, :content, :flavor, :rich, :sweet, :title).merge(bean_id: params[:bean_id])
    end
end
