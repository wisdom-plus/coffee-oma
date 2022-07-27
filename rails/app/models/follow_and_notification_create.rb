class FollowAndNotificationCreate
  def initialize(user, follower)
    @user = user
    @follower = follower
  end

  def create
    follow = Follow.new(@user, @follower).follow
    create_notification(@user, follow)
    follow
  end

  private

    def create_notification(user, follow)
      notification = Notification.new(source: follow, user: user)
      notification.save
    end
end
