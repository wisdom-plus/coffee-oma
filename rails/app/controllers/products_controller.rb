class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  after_action  -> { CreateHistoryJob.perform_now(current_user.id, history_params) }, only: %i[show], if: :user_signed_in?

  def new
    @product = Product.new(tag_list: 'コーヒー')
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'アイテムを登録しました'
    else
      flash.now[:alert] = 'アイテムの登録に失敗しました'
      render :new
    end
  end

  def index
    @q = Product.keywords_search(params[:q])
    @products = if params[:tag_name]
                  Product.tag_result(params[:tag_name], params[:page])
                else
                  @q.result(distinct: true).page(params[:page]).per(INDEX_DISPALY_NUM)
                end
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product
      @tags = @product.tag_counts_on(:tags)
      @rate = @product.rate_average_num
      @rate_average = @product.rate_average
      @review = Review.new
      @reviews = Review.show_review(@product.id, params[:page])
      @like = current_user.product_likes.find_by(liked_id: params[:id]) if user_signed_in?
    else
      redirect_to products_path, alert: '存在しないページです。'
    end
  end

  private

    def product_params
      params.require(:product).permit(:itemname, :itemprice, :shopname, :imageurl, :itemurl, :itemcaption, :tag_list)
    end

    def history_params
      params.permit(:controller, :id)
    end
end
