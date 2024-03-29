class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :product_exists?, only: %i[show]
  after_action  -> { CreateHistoryJob.perform_later(current_user.id, history_params) }, only: %i[show], if: -> { user_signed_in? && @product }

  def index
    @q = Product.keywords_search(params[:q])
    @products =
      if params[:tag_name]
        Product.tag_result(params[:tag_name], params[:page]).includes(%i[thread_image brand])
      else
        @q.result(distinct: true).includes(%i[thread_image brand]).page(params[:page]).per(INDEX_DISPALY_NUM)
      end
  end

  def show
    @product = Product.find_by(id: params[:id]).decorate
    @tags = @product.tag_counts_on(:tags)
    @review = Review.new
  end

  def new
    @product = Product.new(tag_list: 'コーヒー')
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to products_path, notice: t('.notice'), status: :see_other
    else
      flash.now[:alert] = t('.alert')
      render :new, status: :unprocessable_entity
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :url, :caption, :tag_list, :brand_id, images: [])
    end

    def history_params
      params.permit(:controller, :id)
    end

    def product_exists?
      return false if Product.exists?(id: params[:id])

      redirect_to products_path, alert: t('.alert'), status: :see_other
    end
end
