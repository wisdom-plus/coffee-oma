module NotificationsHelper
  def unchecked_notifications?
    current_user.passive_notifications.find_by(checked: false).present?
  end
end
