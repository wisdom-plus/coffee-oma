module Api
  module V1
    class ReviewsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create destroy]

      def create
        review = current_api_v1_user.revivews.new(review_params)
        if review.save
          render json: {}, status: :created
        else
          render json: {}, status: :not_found
        end
      end

      def destroy
        review = Review.find_by(id: params[:id], product_id: params[:product_id])
        if review&.destroy
          render json: {}, status: :ok
        else
          render json: {}, status: :not_found
        end
      end

      def exists
        reviews = Review.api_json(params[:product_id])
        if reviews.present?
          render json: { reviews: reviews }, status: :ok
        else
          render json: {}, status: :not_found
        end
      end

      private

        def review_params
          params.require(:review).permit(:title, :content, :rate).merge(product_id: params[:product_id])
        end
    end
  end
end
