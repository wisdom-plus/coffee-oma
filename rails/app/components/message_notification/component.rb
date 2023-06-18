# frozen_string_literal: true

class MessageNotification::Component < ViewComponent::Base
  def initialize(notifications:)
    @notifications = notifications
  end
end
