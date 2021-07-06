class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action :checked_notifications

  def index
    @notifications = current_user.passive_notifications.includes([:visitor], [:review], [:message]).page(params[:page]).per(25)
    @follow_notifications = @notifications.where('action = ?', 'follow')
    @like_notifications = @notifications.where('action = ?', 'like')
    @message_notifications = @notifications.where('action = ?', 'message')
  end

  private

    def checked_notifications
      @notifications.where('checked = ?', false).each do |notification|
        notification.update(checked: true)
      end
    end
end
