class ProductsController < ApplicationController
  def new
    if params[:keyword]
      rakuten_array(params[:keyword])
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
    @q = Product.ransack(params[:q])
    @products = if params[:tag_name]
                  tag_search(params[:tag_name]).page(params[:page]).per(9)
                else
                  @q.result(distinct: true).page(params[:page]).per(9)
                end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    @reviews = Review.where(product_id: @product.id).includes(:user)
    @like = Like.find_by(user_id: current_user.id, product_id: params[:id]) if current_user

    return if @product.reviews.average(:rate).nil?

    gon.star_average = (@product.reviews.average(:rate) * 2).floor / 2.to_f
  end

  def update
    product = Product.find(params[:id])
    product.tag_list.add(params[:tag_list].split(','))
    product.save
    redirect_to product_path(params[:id])
  end

  private

    def rakuten_search(search_keyword, page_count)
      RakutenWebService::Ichiba::Item.search(keyword: search_keyword, imageFlag: 1, page: page_count)
    end

    def product_params
      params.require(:product).permit(:itemname, :itemprice, :shopname, :catchcopy, :imageurl, :itemurl, :itemcaption, :tag_list)
    end

    def rakuten_array(keyword)
      @products_all = []
      (1..5).each do |page_count|
        products = rakuten_search(keyword, page_count)
        products.each do |product|
          if product.name.include?('コーヒー')
            @products_all.push(product)
          end
        end
      end
    end

    def tag_search(tagname)
      Product.tagged_with(tagname.to_s)
    end
end
