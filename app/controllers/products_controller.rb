class ProductsController < ApplicationController
  def new
    if params[:keyword]
      @products = rakuten_search(params[:keyword])
    end
    @product = Product.new
  end

  def create
    products = Product.new(product_params)
    products.save
    redirect_to products_path
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    @reviews = Review.all.includes(:user)
    @like = Like.find_by(user_id: current_user.id, product_id: params[:id]) if current_user
  end

  private

    def rakuten_search(search_keyword)
      RakutenWebService::Ichiba::Item.search(keyword: search_keyword, imageFlag: 1)
    end

    def product_params
      params.require(:product).permit(:itemname, :itemprice, :shopname, :catchcopy, :imageurl, :itemurl, :itemcaption)
    end
end
