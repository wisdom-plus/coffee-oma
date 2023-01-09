class RelationshipsController < ApplicationController
  include TurboStreamComponent
  before_action :authenticate_user!

  def create
    @user = User.find_by(id: params[:follow_id])
    @follow = FollowAndNotificationCreate.new(current_user, @user).create
    create_flash(@follow, @user)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream_component_replace('follow_button', user: @user, follow: @follow),
          turbo_stream_flash(flash)
        ]
      end
      format.html { redirect_to user_registration_path(@user), status: :see_other }
    end
  end

  def destroy
    @user = User.find_by(id: params[:follow_id])
    @follow = Follow.new(current_user, @user).unfollow
    destroy_flash(@follow, @user)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream_component_replace('follow_button', user: @user, follow: nil),
          turbo_stream_flash(flash)
        ]
      end
      format.html { redirect_to user_registration_path(@user), status: :see_other }
    end
  end

  private

    def create_flash(follow, user)
      if follow.save
        flash[:notice] = "#{user.username}をフォローしました"
      else
        # :nocov:
        flash[:alert] = t('.alert')
        redirect_to user_registration_path(user), status: :see_other
        # :nocov:
      end
    end

    def destroy_flash(follow, user)
      if follow.destroy
        flash[:notice] = "#{user.username}のフォローを解除しました"
      else
        # :nocov:
        flash[:alert] = t('.alert')
        redirect_ot user_registration_path(user), status: :see_other
        # :nocov:
      end
    end
end
