class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :product_exists?, only: %i[show]
  after_action  -> { CreateHistoryJob.perform_later(current_user.id, history_params) }, only: %i[show], if: -> { user_signed_in? && @product }

  def new
    @product = Product.new(tag_list: 'コーヒー')
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to products_path, notice: t('.notice')
    else
      flash.now[:alert] = t('.alert')
      render :new
    end
  end

  def index
    @q = Product.keywords_search(params[:q])
    @products = if params[:tag_name]
                  Product.tag_result(params[:tag_name], params[:page])
                else
                  @q.result(distinct: true).includes([:thread_image]).page(params[:page]).per(INDEX_DISPALY_NUM)
                end
  end

  def show
    @product = Product.find_by(id: params[:id])
    @tags = @product.tag_counts_on(:tags)
    @review = Review.new
    @reviews = Review.show_review(@product.id).page(params[:page]).per(SHOW_DISPLAY_NUM)
    return unless user_signed_in?

    @reviews = Review.exclude_reviews(@product.id, current_user.id).page(params[:page]).per(SHOW_DISPLAY_NUM)
    @like = current_user.product_likes.find_by(liked_id: params[:id])
    @review_likes = current_user.where_review_likes(@reviews, 'review')
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :shopname, :url, :caption, :tag_list, image: [])
    end

    def history_params
      params.permit(:controller, :id)
    end

    def product_exists?
      return if Product.exists?(id: params[:id])

      redirect_to products_path, alert: t('.alert')
    end
end
