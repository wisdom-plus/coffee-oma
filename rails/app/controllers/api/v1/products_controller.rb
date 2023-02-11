module Api
  module V1
    class ProductsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create]

      def index
        products = Product.index_pagenation(params[:page].to_i)
        if products.empty?
          render status: :not_found, json: { message: 'Not Found' }
        else
          render json: { product: {
            pages: params[:page].to_i,
            nextpage: next_page?(params[:page].to_i),
            data: products
          } }, status: :ok
        end
      end

      def show
        product = Product.find_by(id: params[:id])
        if product
          render json: {
            product: product.api_json
          }, status: :ok
        else
          render status: :not_found, json: { message: 'Not Found' }
        end
      end

      def create
        @product = current_api_v1_user.products.new(product_params)

        if @product.save
          render json: { message: 'create success' }, status: :created
        else
          render status: :bad_request, json: { message: 'Bad Request' }
        end
      end

      private

        def product_params
          params.require(:product).permit(:name, :price, :url, :shopname, :caption, :tag_list, images: [])
        end

        def next_page?(page)
          !((page + 1) * 9 > Product.count || (page + 1) > 10)
        end
    end
  end
end
