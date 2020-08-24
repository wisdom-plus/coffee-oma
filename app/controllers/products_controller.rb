class ProductsController < ApplicationController
  def new
    if params[:keyword]
      products = rakuten_search(params[:keyword])
      @products_all = []
      products.each do |product|
        if product.name.include?(" コーヒー")
          @products_all.push(product)
        end
      end
      if @products_all.present?
        @products = Kaminari.paginate_array(@products_all).page(params[:page]).per(9)
      end
    end
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to products_path
  end

  def rakuten_create
    product = Product.new(product_params)
    product.remote_imageurl_url = product_params[:imageurl].chomp('?_ex=128x128')
    product.save
    redirect_to products_path
  end

  def index
    @q =Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(9)
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
      params.require(:product).permit(:itemname, :itemprice, :shopname, :catchcopy, :imageurl, :itemurl, :itemcaption, :rakuten)
    end
end
