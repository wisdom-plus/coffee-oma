class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications.includes([:visitor], [:review], [:message]).page(params[:page]).per(25)
    @notifications.where('checked = ?', false).each do |notification|
      notification.update(checked: true)
    end
    @follow_notifications = @notifications.where('action = ?', 'follow')
    @like_notifications = @notifications.where('action = ?', 'like')
    @message_notifications = @notifications.where('action = ?', 'message')
  end
end
