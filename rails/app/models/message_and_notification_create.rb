class MessageAndNotificationCreate

  def initialize(user)
    @user = user
  end

  def crete(message_params)
    message = @user.messages.new(message_params)
    if message.save
      create_notification(message)
    end

    return message
  end

  private

  def create_notification(message)
    notification = @user.active_notifications.new(visited_id: message.room.another_user(@user).id,message: message, action: 'message')
    notification.save
  end
end
