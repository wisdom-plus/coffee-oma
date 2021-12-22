class BeansController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  after_action  -> { CreateHistoryJob.perform_now(current_user.id, history_params) }, only: %i[show], if: :user_signed_in?

  def new
    @bean = Bean.new(tag_list: 'コーヒー')
  end

  def create
    @bean = current_user.beans.new(bean_params)
    if @bean.save
      redirect_to beans_path, notice: '登録に成功しました。'
    else
      flash.now[:alert] = '登録に失敗しました'
      render :new
    end
  end

  def show
    @bean = Bean.find_by(id: params[:id])
    if @bean
      @tags = @bean.tag_counts_on(:tags)
      @bean_reviews = BeanReview.show_review(@bean.id, params[:page])
      @bean_review = BeanReviewForm.new
      @like = current_user.bean_likes.find_by(liked_id: params[:id]) if user_signed_in?
    else
      redirect_to beans_path,alert: '存在しないページです。'
    end
  end

  def index
    @q = Bean.keywords_search(params[:q])
    @beans = if params[:tag_name]
               Bean.tag_result(params[:tag_name], params[:page])
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
