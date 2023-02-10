module Api
  module V1
    class RelationshipsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create destroy]

      def create
        user = User.find_by(id: params[:relationships][:followed_id])
        follow = current_api_v1_user.folow(user)
        if follow.ni?
          render status: :not_found
        else
          render status: :created
        end
      end

      def destroy
        follow = current_api_v1_user.unfollow(params[:id])
        if follow.nil?
          render status: :not_found
        else
          render status: :ok
        end
      end

      def exists
        user = User.find_by(id: params[:follow_id])
        if user
          follow =
            if api_v1_user_signed_in?
              current_api_v1_user.following?(user)
            else
              false
            end
          render json: { follow: follow }, status: :ok
        else
          render json: {}, status: :not_found
        end
      end
    end
  end
end
