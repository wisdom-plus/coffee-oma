class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:follow_id])
    @follow = current_user.follow(@user)
    if @follow.save
      @user.create_notification_follow(current_user)
      render 'create.js.erb'
    else
      flash.now[:alert] = 'フォローに失敗しました'
    end
  end

  def destroy
    @user = User.find(params[:follow_id])
    follow = current_user.unfollow(@user)
    if follow.destroy
      render 'destroy.js.erb'
    else
      flash.now[:alert] = 'フォロー解除に失敗しました'
    end
  end
end
