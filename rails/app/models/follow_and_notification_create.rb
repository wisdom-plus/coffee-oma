class FollowAndNotificationCreate
  def initialize(user, current_user)
    @user = user
    @current_user = current_user
  end

  def create
    follow = Follow.new(@current_user, @user).follow
    create_notification(@current_user,follow)
    follow
  end

  private

    def create_notification(current_user,follow)
      temp = follow.notifications
      if temp.present?
        temp.update(checked: false)
      else
        notification = current_user.notifications.new(source: follow)
        notification.save
      end
    end
end
