# frozen_string_literal: true

class LikeNotification::Component < ViewComponent::Base
  def initialize(notifications:)
    @notifications = NotificationDecorator.decorate_collection(notifications)
    super
  end
end
