class FollowAndNotificationCreate
  def initialize(user, follower)
    @user = user
    @follower = follower
  end

  def create
    follow = Follow.new(@user, @follower)
    return false if @user == @follower

    follow = follow.follow
    create_notification(follow)
    follow
  end

  private

    def create_notification(follow)
      notification = Notification.new(source: follow, user: follow.follow)
      notification.save
    end
end
