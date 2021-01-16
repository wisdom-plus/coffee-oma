class BeanReviewsController < ApplicationController
  def create
    binding.pry
    @bean_review = current_user.bean_reviews.new(bean_review_params)
    @recipe = @bean_review.recipe.new(recipe_params)
    if @bean_review.save && @recipe.save
      flash[:notice] = '登録に成功しました'
    elsif @recipe == nil
      flash[:notice] = 'レシピの登録に失敗しました'
    else
      flash[:alert] = 'レビューの登録に失敗しました'
    end
    redirect_to bean_path(@bean_review.bean_id)
  end

  private

    def bean_review_params
      params.require(:bean_review).permit(:acidity, :bitter, :content, :flavor, :rich, :sweet, :title).merge(bean_id: params[:bean_id])
    end

    def recipe_params
      params.require(:bean_review).permit(:powdergram, :grinding, :temperature, :time, :amount, :time1, :time2)
    end
end
