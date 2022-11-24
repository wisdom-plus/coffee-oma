# frozen_string_literal: true

class Alert::Component < ViewComponent::Base
  def initialize(alert:)
    @alert = alert
  end

  def render?
    @alert.present?
  end
end
