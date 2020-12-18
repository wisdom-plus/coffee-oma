class BeanReviewsController < ApplicationController
  def new
    @bean_review = Bean_review.new
  end


  def create
    @bean_review = Object.new(params[:bean_review])
    if @bean_review.save
      flash[:success] = "登録に成功しました"
      redirect_to @bean_review
    else
      flash[:error] = "登録に失敗しました"
      render
    end
  end

  private

  def bean_review_params
    params.require(:bean_review).permit(:acidity, :bitter, :content, :flavor, :rich, :sweet)
  end

end
