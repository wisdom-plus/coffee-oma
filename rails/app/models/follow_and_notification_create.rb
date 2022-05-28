class FollowAndNotificationCreate
  def initialize(user,current_user)
    @user = user
    @current_user = current_user
  end

  def create
    follow = Follow.new(@current_user, @user).follow
    create_notification(@current_user)
    return follow
  end

  private

  def create_notification(current_user)
    @user.create_notification_follow(current_user)
  end
end
