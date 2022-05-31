class FollowAndNotificationCreate
  def initialize(user, current_user)
    @user = user
    @current_user = current_user
  end

  def create
    follow = Follow.new(@current_user, @user).follow
    create_notification(@current_user)
    follow
  end

  private

    def create_notification(current_user)
      temp = Notification.follow_notification(current_user.id, @user.id)
      if temp.present?
        temp.update(checked: false)
      else
        notification = current_user.active_notifications.new(visited_id: current_user.id, action: 'follow')
        notification.save
      end
    end
end
