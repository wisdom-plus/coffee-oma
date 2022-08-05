class MessageAndNotificationCreate
  def initialize(user)
    @user = user
  end

  def crete(message_params)
    message = @user.messages.new(message_params)
    if message.save
      create_notification(message)
    end

    message
  end

  private

    def create_notification(message)
      notification = Notification.new(source: message, user: message.receiver)
      notification.save
    end
end
