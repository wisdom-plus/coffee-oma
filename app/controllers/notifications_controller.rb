class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications.includes([:visitor], [:review], [:message]).page(params[:page]).per(10)
    @notifications.where('checked = ?', false).each do |notification|
      notification.update(checked: true)
    end
  end
end
