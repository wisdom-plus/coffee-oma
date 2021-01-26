class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update]

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to products_path, notice: 'アイテムを登録しました'
    else
      flash.now[:alert] = 'アイテムの登録に失敗しました'
      render :new
    end
  end

  def index
    @q = Product.ransack(params[:q])
    @products = if params[:tag_name]
                  Product.tag_search(params[:tag_name]).page(params[:page]).per(INDEX_DISPALY_NUM)
                else
                  @q.result(distinct: true).page(params[:page]).per(INDEX_DISPALY_NUM)
                end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    @reviews = Review.where('product_id = ?', @product.id).includes(:user).page(params[:page]).per(SHOW_DISPLAY_NUM)
    @like = Like.find_by(user_id: current_user.id, product_id: params[:id]) if current_user

    return if @product.reviews.average(:rate).nil?

    gon.rate_average = @product.rate_average
  end

  def update
    product = Product.find(params[:id])
    product.tag_list_add(params[:tag_list])
    if product.save
      redirect_to product_path(params[:id])
    else
      render product_path(params[:id])
    end
  end

  private

    def product_params
      params.require(:product).permit(
        :itemname, :itemprice, :shopname, :imageurl, :itemurl, :itemcaption
      ).merge(tag_list: params[:product][:tag_list].split(' '))
    end
end
