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
    notification = @user.create_message_notification(message.id, message.room.another_user(@user).id)
    notification.save
  end
end
