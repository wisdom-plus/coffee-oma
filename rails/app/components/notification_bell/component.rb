# frozen_string_literal: true

class NotificationBell::Component < ViewComponent::Base
  def initialize(checked:)
    @checked = checked
    super
  end
end
