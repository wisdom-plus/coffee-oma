class BeansController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @bean = Bean.new
  end

  def create
    @bean = current_user.beans.new(bean_params)
    if @bean.save
      flash[:success] = '登録に成功しました'
      redirect_to beans_path
    else
      flash[:error] = '登録に失敗しました'
      render :new
    end
  end

  def show
    @bean = Bean.find(params[:id])
    @bean_reviews = BeanReview.where('bean_id= ?', @bean.id).includes([:user])
    @bean_review = BeanReview.new
    @recipe = Recipe.new
    return if @bean_reviews.empty?

    gon.evaluation = @bean.evaluations
  end

  def index
    @q = Bean.ransack(params[:q])
    @beans = @q.result(distinct: true).page(params[:page]).per(9)
  end

  private

    def bean_params
      params.require(:bean).permit(:area, :country, :name, :purification, :roast, :url, :description, :image)
    end
end
