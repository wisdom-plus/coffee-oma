# frozen_string_literal: true

class FollwNotification::Component < ViewComponent::Base
  def initialize(notifications:)
    super
    @notifications = filter_notifications(notifications)
  end

  def filter_notifications(notifications)
    notifications.select { |n| n.source_type == 'Relationship' }
  end
end
