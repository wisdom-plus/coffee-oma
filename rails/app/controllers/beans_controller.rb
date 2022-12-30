class BeansController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :bean_exists?, only: %i[show]
  after_action  -> { CreateHistoryJob.perform_later(current_user.id, history_params) }, only: %i[show], if: -> { user_signed_in? && @bean }

  def new
    @bean = Bean.new(tag_list: 'コーヒー')
  end

  def create
    @bean = current_user.beans.new(bean_params)
    if @bean.save
      redirect_to beans_path, notice: t('.notice')
    else
      flash.now[:alert] = t('.alert')
      render :new, status: :unprocessable_entity
    end
  end

  def show  # rubocop:disable Metrics/AbcSize
    @bean = Bean.find_by(id: params[:id]).decorate
    @tags = @bean.tag_counts_on(:tags)
    @bean_reviews = BeanReview.show_review(@bean.id).page(params[:page]).per(SHOW_DISPLAY_NUM)
    @bean_review_form = BeanReviewForm.new
    if user_signed_in?
      @like = current_user.bean_likes.find_by(liked_id: params[:id])
      @bean_reviews = BeanReview.exclude_reviews(@bean.id, current_user.id).page(params[:page]).per(SHOW_DISPLAY_NUM)
      @review_likes = current_user.where_review_likes(@bean_reviews, 'bean_review')
    end
    @bean_reviews = BeanReviewDecorator.decorate_collection(@bean_reviews)
  end

  def index
    @q = Bean.keywords_search(params[:q])
    @beans = if params[:tag_name]
               Bean.tag_result(params[:tag_name], params[:page])
             else
               @q.result(distinct: true).includes([:thread_image]).page(params[:page]).per(INDEX_DISPALY_NUM)
             end
  end

  private

    def bean_params
      params.require(:bean).permit(:area, :country, :name, :purification, :roast, :url, :description, :tag_list, images: [])
    end

    def history_params
      params.permit(:controller, :id)
    end

    def bean_exists?
      return if Bean.exists?(id: params[:id])

      redirect_to beans_path, alert: t('.alert')
    end
end
