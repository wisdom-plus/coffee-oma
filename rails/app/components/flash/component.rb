# frozen_string_literal: true

class Flash::Component < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(flash:)
    super
    @notice = flash[:notice]
    @alert = flash[:alert]
  end
end
