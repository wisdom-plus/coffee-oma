class BeanReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @bean_review = Form::BeanReviewForm.new(bean_review_recipe_params)
    if @bean_review.save(current_user)
      flash[:notice] = 'レビューの登録に成功しました'
    else
      flash[:alert] = 'レビューの登録に失敗しました'
    end
    redirect_to bean_path(@bean_review.bean_id)
  end

  private

    def bean_review_recipe_params
      params.require(:bean_review).permit(:acidity, :bitter, :content, :flavor, :rich, :sweet, :title, :powdergram, :grinding, :temperature, :time,
                                          :amount, :time1, :time2).merge(bean_id: params[:bean_id])
    end
end
