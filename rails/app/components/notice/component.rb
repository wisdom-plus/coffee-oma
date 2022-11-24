# frozen_string_literal: true

class Notice::Component < ViewComponent::Base
  def initialize(notice:)
    @notice = notice
  end

  def render?
    @notice.present?
  end
end
