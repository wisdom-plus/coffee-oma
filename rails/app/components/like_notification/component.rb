# frozen_string_literal: true

class LikeNotification::Component < ViewComponent::Base
  def initialize(notifications:)
    @notifications = filter_notifications(notifications)
  end

  def filter_notifications(notifications)
    notifications.select { |n| n.source_type == 'Like' }
  end
end
