# frozen_string_literal: true

class LikeNotification::Component < ViewComponent::Base
  def initialize(notifications:)
    @notifications = notifications
  end
end
