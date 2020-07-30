class ProductsController < ApplicationController

  def new
    if params[:keyword]
      @items = rakuten_search(params[:keyword])
    end
    @product = Product.new
  end

  def create
    items = Product.new(product_params)
    items.save
    redirect_to products_path
  end

  def index
    @items = Product.all
  end

  def show
    @item = Product.find(params[:id])
  end

  private

  def rakuten_search(search_keyword)
    RakutenWebService::Ichiba::Item.search(keyword: search_keyword,imageFlag: 1)
  end

  def product_params
    params.require(:product).permit(:itemname, :itemprice, :shopname, :catchcopy, :imageurl,:itemurl, :itemcaption)
  end
end
