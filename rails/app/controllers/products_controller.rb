class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  after_action  -> { update_history(history_params) }, only: %i[show], if: :user_signed_in?

  def new
    @product = Product.new(tag_list: 'コーヒー')
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'アイテムを登録しました'
    else
      flash.now[:alert] = 'アイテムの登録に失敗しました'
      render :new
    end
  end

  def index
    @q = Product.ransack(params[:q])
    @products = if params[:tag_name]
                  Product.tag_result(params[:tag_name], params[:page])
                else
                  @q.result(distinct: true).page(params[:page]).per(INDEX_DISPALY_NUM)
                end
  end

  def show
    @product = Product.find(params[:id])
    @tags = @product.tag_counts_on(:tags)
    @review = Review.new
    @reviews = Review.show_review(@product.id, params[:page])
    @like = current_user.product_likes.find_by(liked_id: params[:id]) if user_signed_in?
  end

  private

    def product_params
      params.require(:product).permit(:itemname, :itemprice, :shopname, :imageurl, :itemurl, :itemcaption, :tag_list)
    end

    def history_params
      params.permit(:controller, :id)
    end

    def update_history(_params)
      current_user.create_or_update_history(history_params)
    end
end
