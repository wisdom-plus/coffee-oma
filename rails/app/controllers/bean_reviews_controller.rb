class BeanReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @bean_review = BeanReviewForm.new(bean_review_recipe_params)
    if @bean_review.save(current_user)
      flash[:notice] = t('.notice')
    else
      flash[:alert] = t('.alert')
    end
    redirect_to bean_path(@bean_review.bean_id)
  end

  private

    def bean_review_recipe_params
      params.require(:bean_review).permit(:acidity, :bitter, :content, :flavor, :rich, :sweet, :title, :powdergram, :grinding, :temperature, :time,
                                          :amount, :time1, :time2).merge(bean_id: params[:bean_id])
    end
end
