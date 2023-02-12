module Api
  module V1
    class LikesController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create destroy]

      def index
        ranks = Product.all.order('likes_count desc').limit(9)
        if ranks.empty?
          render json: { message: 'いいねがありません' }, status: :not_found
        else
          render json: { likes: ranks }, status: :ok
        end
      end

      def create
        like = current_api_v1_user.product_likes.new(like_params)
        if like.save
          render json: {}, status: :created
        else
          render json: {}, status: :not_found
        end
      end

      def destroy
        like = current_api_v1_user.product_likes.find_by(id: params[:id])
        if like&.destroy
          render json: {}, status: :ok
        else
          render json: {}, status: :not_found
        end
      end

      def exists
        product = Product.find_by(id: params[:liked_id])
        if product
          liked = api_v1_user_signed_in? && product.product_likes.exists?(user_id: current_api_v1_user.id)
          render json: { liked: liked, count: product.product_likes.size }, status: :ok
        else
          render json: {}, status: :not_found
        end
      end

      private

        def like_params
          params.require(:like).permit(:liked_id)
        end
    end
  end
end
