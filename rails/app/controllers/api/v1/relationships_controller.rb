module Api
  module V1
    class RelationshipsController < ApplicationController
      before_action :authenticate_api_v1_user!, only: %i[create destroy]

      def create
        user = User.find_by(id: params[:relationships][:follow_id])

        return render json: { message: 'user not found' }, status: :not_found unless user

        follow = FollowAndNotificationCreate.new(current_api_v1_user, user).create
        if follow.save
          render json: {}, status: :created
        else
          render json: {}, status: :bad_request
        end
      end

      def destroy
        user = User.find_by(id: params[:id])

        return render json: { message: 'user not found' }, status: :not_found unless user

        follow = Follow.new(current_api_v1_user, user).unfollow
        if follow.destroy
          render json: {}, status: :ok
        else
          render json: {}, status: :bad_request
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
