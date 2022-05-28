class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by(id: params[:follow_id])
    @follow = Follow.new(current_user, @user).follow
    @user.create_notification_follow(current_user)
    # @userと@followが必要
    respond_to do |format|
      format.js
      format.html { redirect_to user_registration_path(@user) }
    end
  end

  def destroy
    @user = User.find_by(id: params[:follow_id])
    @follow = Follow.new(current_user, @user).unfollow
    respond_to do |format|
      format.js
      format.html { redirect_to user_registration_path(@user) }
    end
  end
end
