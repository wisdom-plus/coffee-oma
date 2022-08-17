class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by(id: params[:follow_id])
    @follow = FollowAndNotificationCreate.new(current_user, @user).create
    if @follow.save
      @notice = "#{@user.username}をフォローしました"
    else
      # :nocov:
      @alert = 'フォローに失敗しました'
      # :nocov:
    end
    respond_to do |format|
      format.js
      format.html { redirect_to user_registration_path(@user) }
    end
  end

  def destroy
    @user = User.find_by(id: params[:follow_id])
    @follow = Follow.new(current_user, @user).unfollow
    if @follow.destroy
      @notice = "#{@user.username}のフォローを解除しました"
    else
      # :nocov:
      @alert = 'フォロー解除に失敗しました'
      # :nocov:
    end
    respond_to do |format|
      format.js
      format.html { redirect_to user_registration_path(@user) }
    end
  end
end
