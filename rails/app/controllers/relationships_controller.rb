class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action -> { find_user(params[:follow_id]) }

  def create
    @follow = current_user.follow(@user)
    @user.create_notification_follow(current_user)
    respond_to do |format|
      format.js
      format.html { redirect_to user_registration_path(@user) }
    end
  end

  def destroy
    @follow = current_user.unfollow(@user)
    respond_to do |format|
      format.js
      format.html { redirect_to user_registration_path(@user) }
    end
  end

  private

    def find_user(follow_id)
      @user = User.find_by(id: follow_id)
    end
end
