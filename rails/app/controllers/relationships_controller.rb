class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by(id: params[:follow_id])
    @follow = FollowAndNotificationCreate.new(current_user, @user).create
    if @follow.save
      @notice = "#{@user.username}をフォローしました"
    else
      @alert = 'フォローに失敗しました'
    end
    # @userと@followが必要
    respond_to do |format|
      format.js
      format.html { redirect_to user_registration_path(@user) }
    end
  end

  def destroy
    @user = User.find_by(id: params[:follow_id])
    @follow = Follow.new(current_user, @user).unfollow
    if @follow.destroy
      @notice = "#{@user.username}フォローを解除しました"
    else
      @alert = 'フォロー解除に失敗しました'
    end
    respond_to do |format|
      format.js
      format.html { redirect_to user_registration_path(@user) }
    end
  end
end
