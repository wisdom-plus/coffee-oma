module Api
  module V1
    class LikesController < ApiApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create destroy]

      def index
        ranks = Product.all.order('likes_count desc').limit(9)
        if likes.empty?
          render status: :not_found, json: { message: 'いいねがありません' }
        else
          render json: { likes: ranks }, status: :ok
        end
      end

      def create
        like = current_api_v1_user.product_likes.new(like_params)
        if like.save
          render status: :created
        else
          render status: :not_found
        end
      end

      def destory
        like = current_api_v1_user.product_likes.find_by(product_id: params[:id])
        if like&.destory
          render status: :ok
        else
          render status: :not_found
        end
      end

      def exists
        product = Product.find_by(id: params[:id])
        if product
          liked = api_v1_user_signed_in && product.product_likes.exists(user_id: current_api_v1_user.id)
          render json: { liked: liked, count: product.likes.size }, status: :ok
        else
          render status: :not_found
        end
      end

      private

        def like_params
          params.require(:like).permit(:product_id)
        end
    end
  end
end
