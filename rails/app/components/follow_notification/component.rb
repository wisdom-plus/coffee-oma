# frozen_string_literal: true

class FollowNotification::Component < ViewComponent::Base
  def initialize(notifications:)
    @notifications = notifications
    super
  end
end
