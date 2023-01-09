class RelationshipsController < ApplicationController
  include TurboStreamComponent
  before_action :authenticate_user!

  def create
    @user = User.find_by(id: params[:follow_id])
    @follow = FollowAndNotificationCreate.new(current_user, @user).create
    if @follow.save
      flash[:notice] = "#{@user.username}をフォローしました"
    else
      # :nocov:
      flash[:alert] = t('.alert')
      # :nocov:
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(
            'follow_button',
            FollowButton::Component.new(user: @user, follow: @follow).render_in(view_context)
          ),
          turbo_stream_flash(flash, view_context)
        ]
      end
      format.html { redirect_to user_registration_path(@user), status: :see_other }
    end
  end

  def destroy
    @user = User.find_by(id: params[:follow_id])
    @follow = Follow.new(current_user, @user).unfollow
    if @follow.destroy
      flash[:notice] = "#{@user.username}のフォローを解除しました"
    else
      # :nocov:
      flash[:alert] = t('.alert')
      # :nocov:
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(
            'follow_button',
            FollowButton::Component.new(user: @user, follow: nil).render_in(view_context)
          ),
          turbo_stream_flash(flash, view_context)
        ]
      end
      format.html { redirect_to user_registration_path(@user), status: :see_other }
    end
  end
end
