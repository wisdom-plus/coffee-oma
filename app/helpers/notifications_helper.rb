module NotificationsHelper
  def unchecked_notifications?
    notifications = current_user.passive_notifications.where("checked = ?", false)
    notifications.any?
  end

end
