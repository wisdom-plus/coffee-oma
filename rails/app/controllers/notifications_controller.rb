class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action -> { Notification.checked_notifications(current_user.id) }

  def index
    @notifications = current_user.passive_notifications.includes([:visitor], [:review], [:message]).page(params[:page]).per(25)
    @follow_notifications = @notifications.action_follow
    @like_notifications = @notifications.action_like
    @message_notifications = @notifications.action_message
  end
end
