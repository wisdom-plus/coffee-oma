class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:follow_id])
    @follow = current_user.follow(@user)
    @user.create_notification_follow(current_user)
    render 'create.js.erb'
  end

  def destroy
    @user = User.find(params[:follow_id])
    follow = current_user.unfollow(@user)
    render 'destroy.js.erb'
  end
end
