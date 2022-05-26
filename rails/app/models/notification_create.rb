class NotificationCreate
# notificationを作成する

  def initialize(user)
    @user = user
  end

  def create_like_notification(like_id, user_id, action)
    user.active_notifications.new(like_id: like_id, visited_id: user_id, action: action)
  end

  def create_follow_notification(follower_id)
    user.active_notifications.new(visited_id: follower_id, action: 'follow')
  end

  def create_message_notification(message_id, user_id)
    user.active_notifications.new(message_id: message_id, visited_id: user_id, action: 'message')
  end

  def create_notification_follow(current_user)
    temp = Notification.follow_notification(current_user.id, id)
    if temp.present?
      temp.update(checked: false)
    else
      notification = current_user.create_follow_notification(id)
      notification.save
    end
  end
end
