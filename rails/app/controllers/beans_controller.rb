class BeansController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @bean = Bean.new(tag_list: 'コーヒー')
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
    @tags = @bean.tag_counts_on(:tags)
    @bean_reviews = BeanReview.where('bean_id= ?', @bean.id).includes([:user], [:recipe]).page(params[:page]).per(SHOW_DISPLAY_NUM)
    @bean_review = BeanReview.new
    @recipe = Recipe.new
    return unless signed_in?

    @like = current_user.bean_likes.find_by(liked_id: params[:id])
    current_user.create_or_update_history(history_params)
  end

  def index
    @q = Bean.ransack(params[:q])
    @beans = if params[:tag_name]
               Bean.tagged_with(params[:tag_name]).page(params[:page]).per(INDEX_DISPALY_NUM)
             else
               @q.result(distinct: true).page(params[:page]).per(INDEX_DISPALY_NUM)
             end
  end

  private

    def bean_params
      params.require(:bean).permit(:area, :country, :name, :purification, :roast, :url, :description, :image, :tag_list)
    end

    def history_params
      params.permit(:controller, :id)
    end
end
