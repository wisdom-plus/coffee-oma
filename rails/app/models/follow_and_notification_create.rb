class FollowAndNotificationCreate
  def initialize(user, current_user)
    @user = user
    @current_user = current_user
  end

  def create
    follow = Follow.new(@current_user, @user).follow
    create_notification(@current_user, follow)
    follow
  end

  private

    def create_notification(_current_user, follow)
      temp = follow.notifications
      if temp.present?
        temp.update(checked: false)
      else
        notification = Notification.new(source: follow, user_id: follow.follow_id)
        notification.save
      end
    end
end
